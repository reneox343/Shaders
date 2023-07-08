void SetColors_float(float3 Color,float3 High,float3 Middle,float3 Low,float3 Bottom, out float3 Out){
    float D = 255;
    if(Color.r >= 0.75){
        Color = High;
    }
    if(Color.r >= 0.5 && Color.r < 0.75)
    {
        Color = Middle;
    }
    if(Color.r >= 0.3 && Color.r < 0.5)
    {
        Color = Low;
    }
    if(Color.r < 0.3)
    {
        Color = Bottom;
    }
    Out = Color;
}
// void Infrared_float(float3 Color,float3 Color8,float3 Color7,float3 Color6,float3 Color5,float3 Color4,float3 Color3,float3 Color2,float3 Color1, out float3 Out){

//     float3 lerpColorMax;
//     float3 lerpColorMin;
//     float m = Color.r;
//     float delta = 0.125;
//     float channel = (Color.r + Color.g +Color.b)/3;
//     if(channel >= 0.875 && channel < 1)
//     {
//         lerpColorMax = Color8;
//         lerpColorMin = Color7;
//         m = (m-1)/ delta;
//     }
//     else if(channel >= 0.75 && channel < 0.875)
//     {
//         lerpColorMax = Color7;
//         lerpColorMin = Color6;
//         m = (m-0.875)/ delta;
//     }
//     else if(channel >= 0.625 && channel < 0.75)
//     {
//         lerpColorMax = Color6;
//         lerpColorMin = Color5;
//         m = (m-0.75)/ delta;
//     }
//     else if(channel >= 0.5 && channel < 0.625)
//     {
//         lerpColorMax = Color5;
//         lerpColorMin = Color4;
//         m = (m-0.625)/ delta;
//     }
//     else if(channel >=0.375 && channel < 0.5)
//     {
//         lerpColorMax = Color4;
//         lerpColorMin = Color3;
//         m = (m-0.5)/ delta;
//     }
//     else if(channel >= 0.25 && channel < 0.375)
//     {
//         lerpColorMax = Color3;
//         lerpColorMin = Color2;
//         m = (m-0.375)/ delta;
//     }
//     else if(channel >= 0.125 && channel < 0.25)
//     {
//         lerpColorMax = Color2;
//         lerpColorMin = Color1;
//         m = (m-0.25)/ delta;
//     }
//     else if(channel < 0.125)
//     {
//         lerpColorMax = Color1;
//         lerpColorMin = Color1;
//         m = 1;
//     }


//     Color = lerp(lerpColorMin, lerpColorMax,m);

//     Out = Color;
// }
//this code takes a texture and makes it change depending on the red channel that it haves also it depends 
//on the value of the channel because it makes a linear interpolation between the colors depending on the range 
void Infrared_float(float3 Color,float3 Color8,float3 Color7,float3 Color6,float3 Color5,float3 Color4,float3 Color3,float3 Color2,float3 Color1, out float3 Out){

    float3 lerpColorMax;
    float3 lerpColorMin;
    float m = Color.r;
    float delta = 0.125;
    // float channel = (Color.r + Color.g +Color.b)/3;
    float channel = Color.r;
    if(channel >= 0.875 && channel <= 1)
    {
        lerpColorMax = Color1;
        lerpColorMin = Color2;
        m = (m-1)/ delta;
    }
    else if(channel >= 0.75 && channel < 0.875)
    {
        lerpColorMax = Color2;
        lerpColorMin = Color3;
        m = (m-0.875)/ delta;
    }
    else if(channel >= 0.625 && channel < 0.75)
    {
        lerpColorMax = Color3;
        lerpColorMin = Color4;
        m = (m-0.75)/ delta;
    }
    else if(channel >= 0.5 && channel < 0.625)
    {
        lerpColorMax = Color4;
        lerpColorMin = Color5;
        m = (m-0.625)/ delta;
    }
    else if(channel >=0.375 && channel < 0.5)
    {
        lerpColorMax = Color5;
        lerpColorMin = Color6;
        m = (m-0.5)/ delta;
    }
    else if(channel >= 0.25 && channel < 0.375)
    {
        lerpColorMax = Color6;
        lerpColorMin = Color7;
        m = (m-0.375)/ delta;
    }
    else if(channel >= 0.125 && channel < 0.25)
    {
        lerpColorMax = Color7;
        lerpColorMin = Color8;
        m = (m-0.25)/ delta;
    }
    else if(channel < 0.125)
    {
        lerpColorMax = Color8;
        lerpColorMin = Color8;
        m = 1;
    }
    Color = lerp(lerpColorMin, lerpColorMax,m);
    Out = Color;
}

void GameColor_float(in float3 Color , out float3 Out){
    float D = 255;
    if(Color.r >= 0.75){
        Color = float3(202.0/D,220.0/D,159.0/D);
    }
    else if(Color.r >= 0.5 && Color.r < 0.75){
        Color = float3(139.0/D,172.0/D,15.0/D);
    }
    else if(Color.r >= 0.3 && Color.r < 0.5){
        Color = float3(48.0/D,98.0/D,48.0/D);
    }else{
        Color = float3(15.0/D,56.0/D,15.0/D);
    }
    Out = Color;
}