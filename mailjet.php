<?php

require_once 'mailjet.civix.php';

/**
 * Implementation of hook_civicrm_alterMailParams( )
 * To add Mailjet headers in mail
 * Hacked overrided civicrm_alterMailParams hooks // TODO::contribute back to the core
 */
function mailjet_civicrm_alterMailParams(&$params, $context, $jobId) {
  if(isset($jobId)){
    $apiParams = array(
      'id' => $jobId
    );
    $mailJobResult = civicrm_api3('MailingJob', 'get', $apiParams);
    $mailingId = $mailJobResult['values'][$jobId]['mailing_id'];
    $params['headers']['X-Mailjet-Campaign'] = $mailingId;
    $params['headers']['X-Mailjet-DeduplicateCampaign'] = 1;
  }
}

/**
 * Implementation of hook_civicrm_config
 */
function mailjet_civicrm_config(&$config) {
  _mailjet_civix_civicrm_config($config);
}

/**
 * Implementation of hook_civicrm_xmlMenu
 *
 * @param $files array(string)
 */
function mailjet_civicrm_xmlMenu(&$files) {
  _mailjet_civix_civicrm_xmlMenu($files);
}

/**
 * Implementation of hook_civicrm_install
 */
function mailjet_civicrm_install() {
  return _mailjet_civix_civicrm_install();
}

/**
 * Implementation of hook_civicrm_uninstall
 */
function mailjet_civicrm_uninstall() {
  return _mailjet_civix_civicrm_uninstall();
}

/**
 * Implementation of hook_civicrm_enable
 */
function mailjet_civicrm_enable() {
  return _mailjet_civix_civicrm_enable();
}

/**
 * Implementation of hook_civicrm_disable
 */
function mailjet_civicrm_disable() {
  return _mailjet_civix_civicrm_disable();
}

/**
 * Implementation of hook_civicrm_upgrade
 *
 * @param $op string, the type of operation being performed; 'check' or 'enqueue'
 * @param $queue CRM_Queue_Queue, (for 'enqueue') the modifiable list of pending up upgrade tasks
 *
 * @return mixed  based on op. for 'check', returns array(boolean) (TRUE if upgrades are pending)
 *                for 'enqueue', returns void
 */
function mailjet_civicrm_upgrade($op, CRM_Queue_Queue $queue = NULL) {
  return _mailjet_civix_civicrm_upgrade($op, $queue);
}

/**
 * Implementation of hook_civicrm_managed
 *
 * Generate a list of entities to create/deactivate/delete when this module
 * is installed, disabled, uninstalled.
 */
function mailjet_civicrm_managed(&$entities) {
  return _mailjet_civix_civicrm_managed($entities);
}