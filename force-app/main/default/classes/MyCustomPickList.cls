global class MyCustomPickList extends VisualEditor.DynamicPickList{
    
    global override VisualEditor.DataRow getDefaultValue(){
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow('yyyy.MMMM.dd hh: :mm a', 'yyyy.MMMM.dd hh: :mm a');
        return defaultValue;
    }
    global override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DataRow value1 = new VisualEditor.DataRow('yyyy.MMMM.dd hh::mm a', 'yyyy.MMMM.dd hh::mm a');
        VisualEditor.DataRow value2 = new VisualEditor.DataRow('EEE, MMM d, \'\'yy', 'EEE, MMM d, \'\'yy');
        VisualEditor.DataRow value3 = new VisualEditor.DataRow('yyMMddHHmmssZ', 'yyMMddHHmmssZ');
        VisualEditor.DynamicPickListRows  myValues = new VisualEditor.DynamicPickListRows();
        myValues.addRow(value1);
        myValues.addRow(value2);
        return myValues;
    }
}