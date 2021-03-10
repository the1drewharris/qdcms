<div id="calendarContainer">
	<div id="eventCalendar"></div>
	<div style="clear: both;"></div>
</div>

<div id="popupDetailHTML" style="display: none;">
	<div class="infoboxstyle">
		<div class="dis">
			<div class="popupDetails">
				<h2>%eventname%</h2>
				  %blob%
				<p style="text-align: left;">
					 <a href="##" title="Delete Event Instance: %eventname%" onclick="confirmdeleteinstance(%eventinstanceid%);">
						 Delete This Instance
					</a> |
				  	<a href="##" title="Delete Event: %eventname%" onclick="confirmdelete(%eventid%)">
					  	Delete All
					</a>
				</p>
			</div>
			<div class="innerC"></div>
		</div>
	</div>
	<script type="text/javascript" src="/js/lib/crm/events/confirm.js"></script>
</div>