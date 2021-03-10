var otherString   = "Other (specify below)";
var stateSpan     = 'state';
var stateSelect   = 'state-select';
var countrySelect = 'country-select';
var defaultState;

window.addEvent('domready', function()
{
	
	defaultState = $(stateSelect).value;

	getStates($(countrySelect).value);
	
	$(countrySelect).addEvent('change',function(e)
	{
		country_code = this.value;
		getStates(country_code);
	});
	
});

var getStates = function(country_code)
{
	var request = new Request.JSON(
	{
		url: '/cms/crm/addressbook/states.json',
  
		onRequest: function()
		{
			$(stateSpan).set('html','Loading...');
		},
		onComplete: function(statesObj)
		{
			$(stateSpan).set('html','');
			setStateValues(statesObj,country_code);
		}
	}).send();
}
	
var setStateValues = function(states,country_code)
{
	state_select = new Element('select',{'name':'state','id':stateSelect}).inject($(stateSpan));
	state_select.set('html','');
	addOtherValue();
	
	states = states.filter(function(state) { return state.country.toUpperCase() === country_code.toUpperCase(); });
	states.each(function(state)
	{
		isSelected = (defaultState === state.abbv) ? true : false;
		var el = new Element('option',{'value': state.abbv, 'selected': isSelected, 'html': state.abbv + ' - ' + state.name});
		el.inject($(stateSelect));
	});
	if(states.length > 5) addOtherValue();
}
var addOtherValue = function()
{
	var el = new Element('option',{'value': '0', 'html': otherString});
	el.inject($(stateSelect));
}