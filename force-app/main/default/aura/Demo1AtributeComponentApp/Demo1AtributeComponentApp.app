<aura:application >
     <aura:attribute name="label" type="String" default="ValueFromApp" />
    <aura:attribute name="amount" type="Decimal" default="0.6" />
    
    
    <c:Demo1AtributeComponent label="MyDemoLabel" amount="0.8"/>
    <hr />
     <c:Demo1AtributeComponent label="{!v.label}" amount="{!v.amount}"/>
</aura:application>