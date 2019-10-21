<?php

class Core_Model_DbTable_AllowEmails extends Engine_Db_Table
{
  public function addEmail($email)
  {
    $exists = (bool) $this->select()
        ->from($this, new Zend_Db_Expr('TRUE'))
        ->where('email = ?', $email)
        ->query()
        ->fetch();

    if( !$exists ) {
      $this->insert(array(
        'email = ?' => strtolower($email),
      ));
    }

    return $this;
  }

  public function addEmails($emails)
  {
    if( empty($emails) || !is_array($emails) ) {
      return $this;
    }
    
    $emails = array_map('strtolower', array_values($emails));
    
    $data = $this->select()
        ->from($this, 'email')
        ->where('email IN(?)', $emails)
        ->query()
        ->fetchAll(Zend_Db::FETCH_COLUMN);

    // New emails
    $newEmails = array_diff($emails, $data);

    foreach( $newEmails as $newEmail ) {
      $this->insert(array(
        'email' => $newEmail,
      ));
    }

    return $this;
  }

  public function getEmails()
  {
    return $this->select()
        ->from($this, 'email')
        ->order('allowemail_id')
        ->query()
        ->fetchAll(Zend_Db::FETCH_COLUMN);
  }

  public function isEmailAllow($email)
  {
    $email = trim($email);
    
    $data = $this->select()
        ->from($this, 'email')
        ->query()
        ->fetchAll(Zend_Db::FETCH_COLUMN);

    $isAllow = false;

    foreach( $data as $test ) {
      if( false === strpos($test, '*') ) {
        if( strtolower($email) == $test ) {
          $isAllow = true;
          break;
        }
      } else if( $test[0] == '/' ) {
        if( @preg_match($test, $email) ) {
          $isAllow = true;
          break;
        }
      } else {
        $pregExpr = preg_quote($test, '/');
        $pregExpr = str_replace('\\*', '.*', $pregExpr);
        $pregExpr = '/^' . $pregExpr . '$/i';
        if( preg_match($pregExpr, $email) ) {
          $isAllow = true;
          break;
        }
      }
    }

    return $isAllow;
  }

  public function setEmails($emails)
  {
    $emails = array_unique(array_map('strtolower', array_values($emails)));

    $data = $this->select()
        ->from($this, 'email')
        ->query()
        ->fetchAll(Zend_Db::FETCH_COLUMN);

    // ensure that each email is trimmed
    $data = !empty($data) ? array_map('trim', $data) : array();
    $emails = !empty($emails) ? array_map('trim', $emails) : array();
    
    // New emails
    $newEmails = array_diff($emails, $data);
    foreach( $newEmails as $newEmail ) {
      $this->insert(array(
        'email' => $newEmail,
      ));
    }

    // Removed emails
    $removedEmails = array_diff($data, $emails);
    if( !empty($removedEmails) ) {
      $this->delete(array(
        'email IN(?)' => $removedEmails,
      ));
    }

    return $this;
  }

  public function removeEmail($email)
  {
    $this->delete(array(
      'email = ?' => strtolower($email),
    ));

    return $this;
  }

  public function removeEmails($emails)
  {
    if( empty($emails) || !is_array($emails) ) {
      return $this;
    }
    
    $emails = array_map('strtolower', array_values($emails));
    
    $this->delete(array(
      'email IN(?)' => $emails,
    ));

    return $this;
  }
}
