<?php
/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */

class Airport_Model_DbTable_Threats extends Core_Model_Item_DbTable_Abstract
{
    protected $_rowClass = 'Airport_Model_Threat';
    
    public function import($airport){
       $data = $this->getData($airport);
       if(empty($data)){
           return;
       }
       foreach($data as $threat){
            if(empty($threat['href'])){
                continue;
            }
            $parts = parse_url($threat['href']);
            if(empty($parts['query'])){
                continue;
            }
            $queryParts = array();
            parse_str($parts['query'], $queryParts);
            if(empty($queryParts['article'])){
                continue;
            }
            $article = $queryParts['article'];
            if($this->exists($article)){
                continue;
            }            
            
            $row = $this->createRow();
            $row->setFromArray(array(
               'title' => $threat['title'],
               'icon' => $threat['src'],
               'href' => $threat['href'],
               'article' => $article,
               'airport_id' => $airport->airport_id,
               'owner_id' => $airport->owner_id
            ));
            $row->save();
       }
    }
    public function exists($article){
        if(empty($article)){
            return false;
        }
        $airport = $this->fetchRow(array('article = ?' => $article));
        if(empty($airport)){
            return false;
        }
        return true;
    }
    public function getData($airport){
        $url = "http://avherald.com/h?search_term=".$airport->title."&opt=0&dosearch=1&search.x=0&search.y=0";
        $dom = new DOMDocument();
        libxml_use_internal_errors(true);
        $client = new Zend_Http_Client($url, array(
            'maxredirects' => 2,
            'timeout' => 10,
        ));
        
          // Try to mimic the requesting user's UA
        $client->setHeaders(array(
            'User-Agent' => $_SERVER['HTTP_USER_AGENT'],
            'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
            'X-Powered-By' => 'Zend Framework'
        ));
        $response = $client->request();
        
        $dom->loadHTML($response);
        $ad1cell = $dom->getElementById("ad1cell");
        $tables = $ad1cell->getElementsByTagName("table");
        if(count($tables) <= 0){
            return array();
        }
        $data = array();
        foreach($tables as $key => $table){
            if($key == 0){
                continue;
            }
            $rows = $table->getElementsByTagName("tr");
            if(count($rows) <= 0){
                continue;
            }
            $tr = $rows->item(0);
            $src = $defaultSrc = "/images/incident.gif";
            try{
                $img = $tr->getElementsByTagName("img")->item(0);
                $src = $img->getAttribute("src");
                if(empty($src)){
                    $src = $defaultSrc;
                }
            } catch (Exception $ex) {

            }
            $href = null;
            try{
                $anchor = $tr->getElementsByTagName("a")->item(0);
                $href = $anchor->getAttribute("href");
                $title = strip_tags($anchor->C14N());
            } catch (Exception $ex) {
                continue;
            }
            if(empty($title)){
                continue;
            }
            $data[] = array(
                'title' => $title,
                'src' => $src,
                'href' => ($href?"http://avherald.com".$href:null)
            );
        }
        return $data;
    }
}
