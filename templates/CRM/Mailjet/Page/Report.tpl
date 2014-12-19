{*
 +--------------------------------------------------------------------+
 | CiviCRM version 4.4                                                |
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC (c) 2004-2013                                |
 +--------------------------------------------------------------------+
 | This file is a part of CiviCRM.                                    |
 |                                                                    |
 | CiviCRM is free software; you can copy, modify, and distribute it  |
 | under the terms of the GNU Affero General Public License           |
 | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
 |                                                                    |
 | CiviCRM is distributed in the hope that it will be useful, but     |
 | WITHOUT ANY WARRANTY; without even the implied warranty of         |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
 | See the GNU Affero General Public License for more details.        |
 |                                                                    |
 | You should have received a copy of the GNU Affero General Public   |
 | License and the CiviCRM Licensing Exception along                  |
 | with this program; if not, contact CiviCRM LLC                     |
 | at info[AT]civicrm[DOT]org. If you have questions about the        |
 | GNU Affero General Public License or the licensing of CiviCRM,     |
 | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
 +--------------------------------------------------------------------+
*}
<fieldset>
<legend>{ts}Mailjet STATS{/ts}</legend>
{if $mailjet_stats}
  {strip}
  <table class="crm-info-panel">
    <tr>
      <td class="label">{ts}Spamass Score{/ts}</td>
      <td>{$mailjet_stats.SpamassScore}</td>
    </tr>
     <tr>
      <td class="label">{ts}Delivered{/ts}</td>
      <td>{$mailjet_stats.DeliveredCount}</td>
    </tr>
     <tr>
      <td class="label">{ts}Opened{/ts}</td>
      <td>{$mailjet_stats.OpenedCount}</td>
    </tr>
     <tr>
      <td class="label">{ts}Clicked{/ts}</td>
      <td>{$mailjet_stats.ClickedCount}</td>
    </tr>
   <tr>
      <td class="label">{ts}Bounce{/ts}</td>
      <td>{$mailjet_stats.BouncedCount}</td>
    </tr>
       <tr>
      <td class="label">{ts}Spam{/ts}</td>
      <td>{$mailjet_stats.SpamComplaintCount}</td>
    </tr>
       <tr>
      <td class="label">{ts}Unsub{/ts}</td>
      <td>{$mailjet_stats.UnsubscribedCount} </td>
    </tr>
       <tr>
      <td class="label">{ts}Blocked{/ts}</td>
      <td>{$mailjet_stats.BlockedCount}</td>
    </tr>
       <tr>
      <td class="label">{ts}Queued{/ts}</td>
      <td>{$mailjet_stats.QueuedCount}</td>
    </tr>
       <tr>
      <td class="label">{ts}Total{/ts}</td>
      <td>{$mailjet_stats.ProcessedCount}</td>
    </tr>
    <tr>
      <td class="label">{ts}Average Click Delay{/ts}</td>
      <td>{$mailjet_stats.AverageClickDelay}</td>
    </tr>
    <tr>
      <td class="label">{ts}Average Open Delay{/ts}</td>
      <td>{$mailjet_stats.AverageOpenDelay}</td>
    </tr>
    <tr>
      <td class="label">{ts}Delivered Rate{/ts}</td>
      <td>{$mailjet_stats.DeliveredCount} ({$mailjet_stats.DeliverRate|string_format:"%0.2f"}%)</td>
    </tr>
    <tr>
      <td class="label">{ts}Queued Rate{/ts}</td>
      <td>{$mailjet_stats.QueuedCount} ({$mailjet_stats.QueuRate|string_format:"%0.2f"}%)</td>
    </tr>
    <tr>
      <td class="label">{ts}Opened Rate{/ts}</td>
      <td>{$mailjet_stats.OpenedCount} ({$mailjet_stats.OpenRate|string_format:"%0.2f"}%)</td>
    </tr>
    <tr>
      <td class="label">{ts}Clicked Rate{/ts}</td>
      <td>{$mailjet_stats.ClickedCount} ({$mailjet_stats.ClickRate|string_format:"%0.2f"}%)</td>
    </tr>
    <tr>
      <td class="label">{ts}Bounce Rate{/ts}</td>
      <td>{$mailjet_stats.BouncedCount} ({$mailjet_stats.BounceRate|string_format:"%0.2f"}%)</td>
    </tr>
       <tr>
      <td class="label">{ts}Spam Rate{/ts}</td>
      <td>{$mailjet_stats.SpamComplaintCount} ({$mailjet_stats.SpamRate|string_format:"%0.2f"}%)</td>
    </tr>
    <tr>
      <td class="label">{ts}Blocked Rate{/ts}</td>
      <td>{$mailjet_stats.BlockedCount} ({$mailjet_stats.BlockRate|string_format:"%0.2f"}%)</td>
    </tr>
    <tr>
      <td class="label">{ts}Unsub Rate{/ts}</td>
      <td>{$mailjet_stats.UnsubscribedCount} ({$mailjet_stats.UnsubscribeRate|string_format:"%0.2f"}%)</td>
    </tr>
  </table>
  {/strip}
<input type="submit" id="updateMailjetButton" name="update_mailjet_button" value="{ts}Manually refresh Mailjet's stats{/ts}" class="form-submit">
{else}
    <div class="messages status no-popup">
        {ts}<strong>Mailjet STATS is not available.</strong> .{/ts}
    </div>
{/if}
</fieldset>
{literal}
<script>
cj(function($) {
  //remove stats report from the default CiviCRM report as we are more interested in Mailjet's stats
  $("td").filter(function() {
    var text = $(this).text();
    switch (text){
      case 'Click-throughs':
      case 'Successful Deliveries':
      case 'Tracked Opens':
        $(this).closest("tr").remove();
        break;
      default:
        break;
    }
  });

  //G: lock is called here
  //TODO: check mailing_id
  $( "#updateMailjetButton" ).on( "click", function() {
    CRM.api('Mailjet',' processBounces',{'mailing_id': {/literal}{$mailing_id}{literal}}, {success:
      function(data) {
        location.reload(true);
      }
    });
  }); //end on click button*/
});
</script>
{/literal}



