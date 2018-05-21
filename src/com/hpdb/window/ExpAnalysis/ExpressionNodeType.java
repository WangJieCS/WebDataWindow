package com.hpdb.window.ExpAnalysis;
public enum ExpressionNodeType {  
  
    Unknown, //非法表达式节点
    Plus,// +  
    Subtract, // -  
    MultiPly,// *  
    Divide,// /  
    LParentheses,// (  
    RParentheses, // )  
    Sqrt, //平方根
    Cbrt, //立方根
    Abs , //绝对值
    Power,// ^ (次幂)  
    Numeric, // 常数  
    Coefficient, //系数
    x   //自变量
}  


