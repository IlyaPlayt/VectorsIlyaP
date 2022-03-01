Shader "Unlit/MyUnlit"
{
    Properties
    {
        _Color("My color",color)=(1,1,1,1)
        _Power("Color Power",float)=0.5
        _MainTwx("MAin texture",2D)="white"{}
    }
    SubShader
    {
        
        Pass
        {
           // ZTest Greater
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float3 normal: NORMAL;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 color: COLOR;
            };
            

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.color.xyz=v.normal.xyz;
                  o.color.a=1;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                return i.color;
            }
            ENDCG
        }
//         Pass
//        {
//            Cull Front
//            CGPROGRAM
//            
//            #pragma vertex vert
//            #pragma fragment frag
//            // make fog work
//            #pragma multi_compile_fog
//
//            #include "UnityCG.cginc"
//
//            struct appdata
//            {
//                float4 vertex : POSITION;
//                float2 uv : TEXCOORD0;
//            };
//
//            struct v2f
//            {
//                float4 vertex : SV_POSITION;
//            };
//            
//
//            v2f vert (appdata v)
//            {
//                v2f o;
//                o.vertex = UnityObjectToClipPos(v.vertex);
//                return o;
//            }
//
//            fixed4 frag (v2f i) : SV_Target
//            {
//                
//                return fixed4(1,0,0,1);
//            }
//            ENDCG
//        }
    }
}
