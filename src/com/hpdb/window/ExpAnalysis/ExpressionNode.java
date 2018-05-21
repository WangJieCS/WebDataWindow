package com.hpdb.window.ExpAnalysis;
public class ExpressionNode {  
  
     private String value;  
       
     private ExpressionNodeType type;  
       
     private int pri;  
       
     private ExpressionNode unitaryNode;  
       
     private Object numeric;  
       
     private static String specialStr = "sqrtcbrtabs";
    /** 
     *  
     * @param value 操作数或运算符 
     */  
    public ExpressionNode(String value)  
    {  
        this.value = value;  
        this.type = parseNodeType(value);  
        this.pri = getNodeTypePRI(this.type);  
        this.numeric = null;  
    }  
  
     
    public Object getNumeric(){  
        if(this.numeric == null){  
                
              
             if (this.type != ExpressionNodeType.Numeric){  
                 return 0;  
             }   
             Double num = new Double(this.value);  
             if (this.unitaryNode != null && this.unitaryNode.type == ExpressionNodeType.Subtract)  
             {  
                 num = 0 - num;  
             }  
             this.numeric =  num;  
        }  
        return numeric;  
    }  
      
      
    public void setNumeric(Object numeric) {  
         this.numeric = numeric;  
         this.value = this.numeric.toString();  
    }  
      
    /** 
     * 设置或返回与当前节点相关联的一元操作符节点 
     * @param unitaryNode 
     */  
    public void setUnitaryNode(ExpressionNode unitaryNode) {  
        this.unitaryNode = unitaryNode;  
    }  
  
    /** 
     *  解析节点类型 
     * @param value 
     * @return 
     */  
    private static ExpressionNodeType parseNodeType(String value)  
    {  
        /*if (StringUtils.isEmpty(value)){  
            return ExpressionNodeType.Unknown;  
        }*/   
        switch (value)  
        {  
            case "+":  
                return ExpressionNodeType.Plus;  
            case "-":  
                return ExpressionNodeType.Subtract;  
            case "*":  
                return ExpressionNodeType.MultiPly;  
            case "/":  
                return ExpressionNodeType.Divide;  
            case "(":  
                return ExpressionNodeType.LParentheses;  
            case ")":  
                return ExpressionNodeType.RParentheses;  
            case "sqrt":  
                return ExpressionNodeType.Sqrt;  
            case "cbrt":  
                return ExpressionNodeType.Cbrt;  
            case "abs":  
                return ExpressionNodeType.Abs;  
            case "^":  
                return ExpressionNodeType.Power; 
            case "x":
            	return ExpressionNodeType.x;
        }  
        if (isNumerics(value))  
        {  
            return ExpressionNodeType.Numeric;  
        }  
        if(isSingleUpper(value))
        {
        	return ExpressionNodeType.Coefficient;
        }
       
        return ExpressionNodeType.Unknown;  
    }  
  
    /** 
     * 获取各节点类型的优先级 
     * @param nodeType 
     * @return 
     */  
    private static int getNodeTypePRI(ExpressionNodeType nodeType)  
    {  
        switch (nodeType)  
        {  
            case LParentheses:  
            case RParentheses:  
                return 4;  
            case Sqrt: 
            case Cbrt:
            case Abs:
            case Power:  
            	return 3;
            case MultiPly:  
            case Divide:  
                return 2;  
            case Plus:  
            case Subtract:  
                return 1;   
            default:  
                return 0;  
        }  
          
    }  
  
    /** 
     * 判断是否为数值 
     * @param op 
     * @return 
     */  
    public static boolean isNumerics(String op)  
    {  
        return op.matches("^[\\+\\-]?(0|[1-9]\\d*|[1-9]\\d*\\.\\d+|0\\.\\d+)");  
    }
    
    /** 
     * 判断是否为数值 
     * @param op 
     * @return 
     */
    public static boolean isSingleUpper(String op)  
    {  
    	char c=op.charAt(0);
        return Character.isUpperCase(c)&&op.length()==1;
    }
    
  
      
    /** 
     * 判断某个字符后是否需要更多的操作符 
     * @param c 
     * @return 
     */  
    public static boolean needMoreOperator(char c)  
    {  
        switch (c)  
        {  
            case '.':   //小数点  
                return true;  
        } 
        
        if(specialStr.indexOf(c)!=-1){
        	return true;
        }
        //数字则需要更多  
        return Character.isDigit(c);  
    }  
  
    /** 
     * 判断两个字符是否是同一类 
     * @param c1 
     * @param c2 
     * @return 
     */  
    public static boolean IsCongener(char c1, char c2)  
    { 
         if ((c1 == '(') || (c2 == '(')){  
             return false;  
         }  
         if ((c1 == ')') || (c2 == ')')){  
             return false;  
         }   
         if (Character.isDigit(c1) || (c1 == '.'))  
         {  
            //c1为数字,则c2也为数字  
             return (Character.isDigit(c2) || (c2 == '.'));  
         }  
         return (!Character.isDigit(c2) && (c2 != '.'));  
    }  
  
    /** 
     * 判断多个字符是否是同一类 
     * @param c1 
     * @param c2 
     * @return 
     */  
    public static boolean IsCongener2(char c,String str){

    	
		return false;
    }
    
    /** 
     * 判断某个字符是否是空白字符 
     * @param c 
     * @return 
     */  
    public static boolean IsWhileSpace(char c)  
    {  
        return c == ' ' || c == '\t';  
    }  
  
    /** 
     * 判断是否是一元操作符节点 
     * @param nodeType 
     * @return 
     */  
    public static boolean IsUnitaryNode(ExpressionNodeType nodeType)  
    {  
        return (nodeType == ExpressionNodeType.Plus ||
        		nodeType == ExpressionNodeType.Subtract||
        		nodeType == ExpressionNodeType.Sqrt||
        		nodeType == ExpressionNodeType.Cbrt||
        		nodeType == ExpressionNodeType.Abs);  
    }
    
    /** 
     * 判断是否是除正负号之外的一元操作符节点 
     * @param nodeType 
     * @return 
     */
    public static boolean IsUnitaryNode2(ExpressionNodeType nodeType)  
    {  
        return (
        		nodeType == ExpressionNodeType.Sqrt||
        		nodeType == ExpressionNodeType.Cbrt||
        		nodeType == ExpressionNodeType.Abs);  
    }
    
  
    public String getValue() {  
        return value;  
    }  
  
    public void setValue(String value) {  
        this.value = value;  
    }  
  
    public ExpressionNodeType getType() {  
        return type;  
    }  
  
    public void setType(ExpressionNodeType type) {  
        this.type = type;  
    }  
  
    public int getPri() {  
        return pri;  
    }  
  
    public void setPri(int pri) {  
        this.pri = pri;  
    }  
  
    public ExpressionNode getUnitaryNode() {  
        return unitaryNode;  
    }  
}