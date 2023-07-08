Shader "Unlit/Grass 2"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _DisplacementTex("Displacement Texture", 2D) = "white" {}
        _Magnitude ("Magnitude", Range(0,1)) = 0.015
        _Treshold ("Treshold", Range(-0.01,0.05)) = 0.015
        _Force ("Force", Vector) = (0,0,0,0)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fog
            #pragma target 3.0
            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                
                float4 texcoord:TEXCOORD1;
                
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            // grass
            sampler2D _DisplacementTex;
            float _Magnitude;
            float _Treshold;
            float4 _Force;
            

            v2f vert (appdata v)
            {
                v2f o;
                float2 distuv = float2(o.uv.x, o.uv.y);
                //this samples a texture to cordinates make the plane vertices move upwards 
                float4 disp = tex2Dlod (_DisplacementTex, float4(v.texcoord.x,v.texcoord.y,0,0));
                //this creates a displacement
                disp = ((disp * 2) - 1) * _Magnitude;
                disp = float4(0,disp.x,0,0);
                v.vertex= v.vertex+disp;
                //this line makes the vertices move depending on their y axis and a treshold  and the _Force variable
                if(v.vertex.y >=_Treshold){
                    v.vertex+= _Force * _SinTime.w*_Force;
                }
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = tex2D(_MainTex, i.uv);
                // apply fog
                UNITY_APPLY_FOG(i.fogCoord, col);
                return col;
            }
            ENDCG
        }
    }
}
