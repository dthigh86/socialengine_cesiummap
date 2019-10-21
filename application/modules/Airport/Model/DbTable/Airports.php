<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

class Airport_Model_DbTable_Airports extends Core_Model_Item_DbTable_Abstract
{
    protected $_rowClass = 'Airport_Model_Airport';

    public function getAirportPaginator($params = array())
    {
        return Zend_Paginator::factory($this->getAirportSelect($params));
    }

    public function getAirportSelect($params = array())
    {
        $select = $this->getItemsSelect(array());

        // Search
        if (isset($params['search'])) {
            $select->where('search = ?', (bool) $params['search']);
        }
        // Category
        if (!empty($params['category_id'])) {
            $select->where('category_id = ?', $params['category_id']);
        }
        
        //Full Text
        if (!empty($params['search_text'])) {
            $select->where("(`description` LIKE ? OR `title` LIKE ?)", '%' . $params['search_text'] . '%');
        }
        if(!empty($params['title'])){
            $select->where("(`title` LIKE ?)", '%' . $params['title'] . '%');
        }
        if(!empty($params['country'])){
            $select->where("(`country` LIKE ?)", '%' . $params['country'] . '%');
        }
        if(!empty($params['region'])){
            $select->where("(`region` LIKE ?)", '%' . $params['region'] . '%');
        }
        if(!empty($params['icao'])){
            $select->where("(`icao` LIKE ?)", '%' . $params['icao'] . '%');
        }
        if(!empty($params['iata'])){
            $select->where("(`iata` LIKE ?)", '%' . $params['iata'] . '%');
        }
        // Order
        if (!empty($params['order'])) {
            $select->order($params['order']);
        } else {
            $select->order('creation_date DESC');
        }

        return $select;
    }

    public function getItemsSelect($params, $select = null)
    {
        if ($select == null) {
            $select = $this->select();
        }

        if (isset($params['search'])) {
            $select->where("search = ?", $params['search']);
        }

        return $select;
    }
    
    public function exists($title){
        if(empty($title)){
            return false;
        }
        $airport = $this->fetchRow(array('title = ?' => $title));
        if(empty($airport)){
            return false;
        }
        return true;
    }
    public function importFile($csvFilePath){
        $data = $this->getData($csvFilePath);
        $auth = Engine_Api::_()->authorization()->context;
        $authView = "everyone";
        $authComment = "everyone";
        $roles = array('owner', 'member', 'parent_member', 'registered', 'everyone');
        $viewMax = array_search($authView, $roles);
        $commentMax = array_search($authComment, $roles);
        $viewer = Engine_Api::_()->user()->getViewer();
        foreach($data as $row){
            if($this->exists($row['title'])){
                continue;
            }
            
            if(empty($row['title']) || empty($row['country']) || empty($row['region'])){
                continue;
            }
            
            $airport = $this->createRow();
            $airport->setFromArray($row);
            $airport->owner_id = $viewer->getIdentity();
            $airport->save();
            
            foreach( $roles as $i => $role ) {
                $auth->setAllowed($airport, $role, 'view',    ($i <= $viewMax));
                $auth->setAllowed($airport, $role, 'comment', ($i <= $commentMax));
            }
        }
    }
    public function getData($filePath){
        $data = array();
        if(!is_readable($filePath)){
            return $data;
        }
        $firstRow = true;
        $fp = fopen($filePath,"r");
        while (($row = fgetcsv($fp, 10000, ",")) !== FALSE) {
            if($firstRow){
                $firstRow = false;
                continue;
            }
            if(empty($row[0]) || empty($row[2])){
                continue;
            }
            foreach ($row as $k => $v){
                $row[$k] = utf8_encode($v);
            }
            
            $data[] = $this->getMappedData($row);            
        }
        fclose($fp);
        return $data;
    }
    public function getMappedData($row){
        $values = array(
            'icao' => isset($row[0])?$row[0]:'',
            'iata' => isset($row[1])?$row[1]:'',
            'title' => isset($row[2])?ucwords(strtolower($row[2])):'',
            'country' => isset($row[3])?ucwords(strtolower($row[3])):'',
            'region' => isset($row[4])?ucwords(strtolower($row[4])):'',
            '777_200lr' => isset($row[5])?$row[5]:'',
            '777_300er' => isset($row[6])?$row[6]:'',
            '777f' => isset($row[7])?$row[7]:'',
            'a380' => isset($row[8])?$row[8]:'',
        );
        return $values;
    }
}
