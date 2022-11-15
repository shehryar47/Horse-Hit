Shader "Hidden/Dof/Bokeh34" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Source ("Base (RGB)", 2D) = "black" {}
	}
	SubShader {
		Pass {
			Blend OneMinusDstColor One, OneMinusDstColor One
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 48257
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 _ArScale;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _Source;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.zw = in_POSITION0.zw;
					    u_xlat1.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat1.xy * _ArScale.xy;
					    u_xlat2 = texture2DLod(_Source, in_TEXCOORD1.xy, 0.0);
					    u_xlat0.xy = u_xlat1.xy * u_xlat2.ww + in_POSITION0.xy;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * vec3(_Intensity);
					    vs_TEXCOORD1.w = u_xlat2.w;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump vec3 u_xlat16_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat16_0.xyz = vs_TEXCOORD1.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat16_0.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.w = u_xlat16_0.x * u_xlat10_1.w;
					    SV_Target0.xyz = u_xlat10_1.xyz * vs_TEXCOORD1.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 _ArScale;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _Source;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.zw = in_POSITION0.zw;
					    u_xlat1.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat1.xy * _ArScale.xy;
					    u_xlat2 = texture2DLod(_Source, in_TEXCOORD1.xy, 0.0);
					    u_xlat0.xy = u_xlat1.xy * u_xlat2.ww + in_POSITION0.xy;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * vec3(_Intensity);
					    vs_TEXCOORD1.w = u_xlat2.w;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump vec3 u_xlat16_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat16_0.xyz = vs_TEXCOORD1.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat16_0.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.w = u_xlat16_0.x * u_xlat10_1.w;
					    SV_Target0.xyz = u_xlat10_1.xyz * vs_TEXCOORD1.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 _ArScale;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _Source;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.zw = in_POSITION0.zw;
					    u_xlat1.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat1.xy * _ArScale.xy;
					    u_xlat2 = texture2DLod(_Source, in_TEXCOORD1.xy, 0.0);
					    u_xlat0.xy = u_xlat1.xy * u_xlat2.ww + in_POSITION0.xy;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * vec3(_Intensity);
					    vs_TEXCOORD1.w = u_xlat2.w;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump vec3 u_xlat16_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat16_0.xyz = vs_TEXCOORD1.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat16_0.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.w = u_xlat16_0.x * u_xlat10_1.w;
					    SV_Target0.xyz = u_xlat10_1.xyz * vs_TEXCOORD1.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 _ArScale;
					uniform 	mediump float _Intensity;
					uniform mediump sampler2D _Source;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.zw = in_POSITION0.zw;
					    u_xlat1.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat1.xy * _ArScale.xy;
					    u_xlat2 = textureLod(_Source, in_TEXCOORD1.xy, 0.0);
					    u_xlat0.xy = u_xlat1.xy * u_xlat2.ww + in_POSITION0.xy;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * vec3(_Intensity);
					    vs_TEXCOORD1.w = u_xlat2.w;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0.xyz = vs_TEXCOORD1.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat16_0.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
					    SV_Target0.xyz = u_xlat16_1.xyz * vs_TEXCOORD1.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 _ArScale;
					uniform 	mediump float _Intensity;
					uniform mediump sampler2D _Source;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.zw = in_POSITION0.zw;
					    u_xlat1.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat1.xy * _ArScale.xy;
					    u_xlat2 = textureLod(_Source, in_TEXCOORD1.xy, 0.0);
					    u_xlat0.xy = u_xlat1.xy * u_xlat2.ww + in_POSITION0.xy;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * vec3(_Intensity);
					    vs_TEXCOORD1.w = u_xlat2.w;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0.xyz = vs_TEXCOORD1.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat16_0.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
					    SV_Target0.xyz = u_xlat16_1.xyz * vs_TEXCOORD1.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 _ArScale;
					uniform 	mediump float _Intensity;
					uniform mediump sampler2D _Source;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.zw = in_POSITION0.zw;
					    u_xlat1.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat1.xy * _ArScale.xy;
					    u_xlat2 = textureLod(_Source, in_TEXCOORD1.xy, 0.0);
					    u_xlat0.xy = u_xlat1.xy * u_xlat2.ww + in_POSITION0.xy;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * vec3(_Intensity);
					    vs_TEXCOORD1.w = u_xlat2.w;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0.xyz = vs_TEXCOORD1.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat16_0.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
					    SV_Target0.xyz = u_xlat16_1.xyz * vs_TEXCOORD1.xyz;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3"
				}
			}
		}
	}
}