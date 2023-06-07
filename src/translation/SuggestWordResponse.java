/**
 * SuggestWordResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package translation;

public class SuggestWordResponse  implements java.io.Serializable {
    private java.lang.String[] suggestWordResult;

    public SuggestWordResponse() {
    }

    public SuggestWordResponse(
           java.lang.String[] suggestWordResult) {
           this.suggestWordResult = suggestWordResult;
    }


    /**
     * Gets the suggestWordResult value for this SuggestWordResponse.
     * 
     * @return suggestWordResult
     */
    public java.lang.String[] getSuggestWordResult() {
        return suggestWordResult;
    }


    /**
     * Sets the suggestWordResult value for this SuggestWordResponse.
     * 
     * @param suggestWordResult
     */
    public void setSuggestWordResult(java.lang.String[] suggestWordResult) {
        this.suggestWordResult = suggestWordResult;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof SuggestWordResponse)) return false;
        SuggestWordResponse other = (SuggestWordResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.suggestWordResult==null && other.getSuggestWordResult()==null) || 
             (this.suggestWordResult!=null &&
              java.util.Arrays.equals(this.suggestWordResult, other.getSuggestWordResult())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getSuggestWordResult() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getSuggestWordResult());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getSuggestWordResult(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(SuggestWordResponse.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://WebXml.com.cn/", ">SuggestWordResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("suggestWordResult");
        elemField.setXmlName(new javax.xml.namespace.QName("http://WebXml.com.cn/", "SuggestWordResult"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://WebXml.com.cn/", "string"));
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
