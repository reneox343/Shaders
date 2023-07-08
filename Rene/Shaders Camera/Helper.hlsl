
//returns colors depending on a float 
void IfHelper_float(float boolean,float3 original,float3 mod,out float3 Out){
    if(boolean >= 1){
        Out = mod;
    }else if(boolean <=0){
        Out = original;
    }

}
