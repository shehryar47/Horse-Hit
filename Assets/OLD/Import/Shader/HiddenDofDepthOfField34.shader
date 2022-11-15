Shader "Hidden/Dof/DepthOfField34" {
	Properties {
		_MainTex ("Base", 2D) = "" {}
		_TapLowBackground ("TapLowBackground", 2D) = "" {}
		_TapLowForeground ("TapLowForeground", 2D) = "" {}
		_TapMedium ("TapMedium", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 25286
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform lowp sampler2D _TapLowBackground;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapLowBackground, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_0 + (-u_xlat10_1);
					    SV_Target0 = u_xlat10_1.wwww * u_xlat16_0 + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform lowp sampler2D _TapLowBackground;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapLowBackground, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_0 + (-u_xlat10_1);
					    SV_Target0 = u_xlat10_1.wwww * u_xlat16_0 + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform lowp sampler2D _TapLowBackground;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapLowBackground, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_0 + (-u_xlat10_1);
					    SV_Target0 = u_xlat10_1.wwww * u_xlat16_0 + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _TapLowBackground;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_TapLowBackground, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_1);
					    SV_Target0 = u_xlat16_1.wwww * u_xlat16_0 + u_xlat16_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _TapLowBackground;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_TapLowBackground, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_1);
					    SV_Target0 = u_xlat16_1.wwww * u_xlat16_0 + u_xlat16_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _TapLowBackground;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_TapLowBackground, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_1);
					    SV_Target0 = u_xlat16_1.wwww * u_xlat16_0 + u_xlat16_1;
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
		Pass {
			ColorMask RGB -1
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 124791
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	mediump float _ForegroundBlurExtrude;
					uniform lowp sampler2D _TapLowForeground;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump float u_xlat16_13;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapLowForeground, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat10_0.xyz + vec3(0.0, 1.0, 0.0);
					    u_xlat16_13 = u_xlat10_0.w * _ForegroundBlurExtrude;
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + vec3(1.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + (-u_xlat16_2.xyz);
					    u_xlat16_3.x = max(u_xlat16_13, u_xlat10_0.w);
					    u_xlat16_13 = u_xlat16_3.x * u_xlat16_3.x;
					    u_xlat16_13 = min(u_xlat16_13, 1.0);
					    u_xlat16_3.yzw = vec3(u_xlat16_13) * u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_1 = (-u_xlat10_0) + u_xlat16_3.yzwx;
					    u_xlat16_3.x = u_xlat16_3.x;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * u_xlat16_1 + u_xlat10_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	mediump float _ForegroundBlurExtrude;
					uniform lowp sampler2D _TapLowForeground;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump float u_xlat16_13;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapLowForeground, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat10_0.xyz + vec3(0.0, 1.0, 0.0);
					    u_xlat16_13 = u_xlat10_0.w * _ForegroundBlurExtrude;
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + vec3(1.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + (-u_xlat16_2.xyz);
					    u_xlat16_3.x = max(u_xlat16_13, u_xlat10_0.w);
					    u_xlat16_13 = u_xlat16_3.x * u_xlat16_3.x;
					    u_xlat16_13 = min(u_xlat16_13, 1.0);
					    u_xlat16_3.yzw = vec3(u_xlat16_13) * u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_1 = (-u_xlat10_0) + u_xlat16_3.yzwx;
					    u_xlat16_3.x = u_xlat16_3.x;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * u_xlat16_1 + u_xlat10_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	mediump float _ForegroundBlurExtrude;
					uniform lowp sampler2D _TapLowForeground;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump float u_xlat16_13;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapLowForeground, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat10_0.xyz + vec3(0.0, 1.0, 0.0);
					    u_xlat16_13 = u_xlat10_0.w * _ForegroundBlurExtrude;
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + vec3(1.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + (-u_xlat16_2.xyz);
					    u_xlat16_3.x = max(u_xlat16_13, u_xlat10_0.w);
					    u_xlat16_13 = u_xlat16_3.x * u_xlat16_3.x;
					    u_xlat16_13 = min(u_xlat16_13, 1.0);
					    u_xlat16_3.yzw = vec3(u_xlat16_13) * u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_1 = (-u_xlat10_0) + u_xlat16_3.yzwx;
					    u_xlat16_3.x = u_xlat16_3.x;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * u_xlat16_1 + u_xlat10_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _ForegroundBlurExtrude;
					uniform mediump sampler2D _TapLowForeground;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump float u_xlat16_13;
					void main()
					{
					    u_xlat16_0 = texture(_TapLowForeground, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(0.0, 1.0, 0.0);
					    u_xlat16_13 = u_xlat16_0.w * _ForegroundBlurExtrude;
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_2.xyz = u_xlat16_0.xyz + vec3(1.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + (-u_xlat16_2.xyz);
					    u_xlat16_3.x = max(u_xlat16_13, u_xlat16_0.w);
					    u_xlat16_13 = u_xlat16_3.x * u_xlat16_3.x;
					    u_xlat16_13 = min(u_xlat16_13, 1.0);
					    u_xlat16_3.yzw = vec3(u_xlat16_13) * u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_3.yzwx;
					    u_xlat16_3.x = u_xlat16_3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
					#else
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					#endif
					    SV_Target0 = u_xlat16_3.xxxx * u_xlat16_1 + u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _ForegroundBlurExtrude;
					uniform mediump sampler2D _TapLowForeground;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump float u_xlat16_13;
					void main()
					{
					    u_xlat16_0 = texture(_TapLowForeground, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(0.0, 1.0, 0.0);
					    u_xlat16_13 = u_xlat16_0.w * _ForegroundBlurExtrude;
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_2.xyz = u_xlat16_0.xyz + vec3(1.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + (-u_xlat16_2.xyz);
					    u_xlat16_3.x = max(u_xlat16_13, u_xlat16_0.w);
					    u_xlat16_13 = u_xlat16_3.x * u_xlat16_3.x;
					    u_xlat16_13 = min(u_xlat16_13, 1.0);
					    u_xlat16_3.yzw = vec3(u_xlat16_13) * u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_3.yzwx;
					    u_xlat16_3.x = u_xlat16_3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
					#else
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					#endif
					    SV_Target0 = u_xlat16_3.xxxx * u_xlat16_1 + u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _ForegroundBlurExtrude;
					uniform mediump sampler2D _TapLowForeground;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump float u_xlat16_13;
					void main()
					{
					    u_xlat16_0 = texture(_TapLowForeground, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(0.0, 1.0, 0.0);
					    u_xlat16_13 = u_xlat16_0.w * _ForegroundBlurExtrude;
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_2.xyz = u_xlat16_0.xyz + vec3(1.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + (-u_xlat16_2.xyz);
					    u_xlat16_3.x = max(u_xlat16_13, u_xlat16_0.w);
					    u_xlat16_13 = u_xlat16_3.x * u_xlat16_3.x;
					    u_xlat16_13 = min(u_xlat16_13, 1.0);
					    u_xlat16_3.yzw = vec3(u_xlat16_13) * u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_3.yzwx;
					    u_xlat16_3.x = u_xlat16_3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
					#else
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					#endif
					    SV_Target0 = u_xlat16_3.xxxx * u_xlat16_1 + u_xlat16_0;
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
		Pass {
			ColorMask RGB -1
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 189512
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform lowp sampler2D _TapLowBackground;
					uniform lowp sampler2D _TapMedium;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapMedium, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat10_0.xyz + vec3(1.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat10_3 = texture2D(_TapLowBackground, vs_TEXCOORD0.xy);
					    u_xlat16_4.xyz = u_xlat10_3.xyz + vec3(0.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + (-u_xlat16_2.xyz);
					    u_xlat16_16 = u_xlat10_3.w * u_xlat10_3.w;
					    u_xlat16_16 = min(u_xlat16_16, 1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_16);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_2.xyz;
					    u_xlat16_1.x = (-u_xlat10_0.w) + u_xlat10_3.w;
					    u_xlat16_3 = u_xlat10_3 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_2.w = u_xlat16_16 * u_xlat16_1.x + u_xlat10_0.w;
					    u_xlat16_0 = u_xlat16_2 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_3;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_1);
					    SV_Target0 = u_xlat10_1.wwww * u_xlat16_0 + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform lowp sampler2D _TapLowBackground;
					uniform lowp sampler2D _TapMedium;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapMedium, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat10_0.xyz + vec3(1.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat10_3 = texture2D(_TapLowBackground, vs_TEXCOORD0.xy);
					    u_xlat16_4.xyz = u_xlat10_3.xyz + vec3(0.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + (-u_xlat16_2.xyz);
					    u_xlat16_16 = u_xlat10_3.w * u_xlat10_3.w;
					    u_xlat16_16 = min(u_xlat16_16, 1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_16);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_2.xyz;
					    u_xlat16_1.x = (-u_xlat10_0.w) + u_xlat10_3.w;
					    u_xlat16_3 = u_xlat10_3 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_2.w = u_xlat16_16 * u_xlat16_1.x + u_xlat10_0.w;
					    u_xlat16_0 = u_xlat16_2 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_3;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_1);
					    SV_Target0 = u_xlat10_1.wwww * u_xlat16_0 + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform lowp sampler2D _TapLowBackground;
					uniform lowp sampler2D _TapMedium;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapMedium, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat10_0.xyz + vec3(1.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat10_3 = texture2D(_TapLowBackground, vs_TEXCOORD0.xy);
					    u_xlat16_4.xyz = u_xlat10_3.xyz + vec3(0.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + (-u_xlat16_2.xyz);
					    u_xlat16_16 = u_xlat10_3.w * u_xlat10_3.w;
					    u_xlat16_16 = min(u_xlat16_16, 1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_16);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_2.xyz;
					    u_xlat16_1.x = (-u_xlat10_0.w) + u_xlat10_3.w;
					    u_xlat16_3 = u_xlat10_3 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_2.w = u_xlat16_16 * u_xlat16_1.x + u_xlat10_0.w;
					    u_xlat16_0 = u_xlat16_2 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_3;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_1);
					    SV_Target0 = u_xlat10_1.wwww * u_xlat16_0 + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _TapLowBackground;
					uniform mediump sampler2D _TapMedium;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat16_0 = texture(_TapMedium, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(1.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3 = texture(_TapLowBackground, vs_TEXCOORD0.xy);
					    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(0.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + (-u_xlat16_2.xyz);
					    u_xlat16_16 = u_xlat16_3.w * u_xlat16_3.w;
					    u_xlat16_16 = min(u_xlat16_16, 1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_16);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_2.xyz;
					    u_xlat16_1.x = (-u_xlat16_0.w) + u_xlat16_3.w;
					    u_xlat16_3 = u_xlat16_3 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_2.w = u_xlat16_16 * u_xlat16_1.x + u_xlat16_0.w;
					    u_xlat16_0 = u_xlat16_2 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_3;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_1);
					    SV_Target0 = u_xlat16_1.wwww * u_xlat16_0 + u_xlat16_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _TapLowBackground;
					uniform mediump sampler2D _TapMedium;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat16_0 = texture(_TapMedium, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(1.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3 = texture(_TapLowBackground, vs_TEXCOORD0.xy);
					    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(0.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + (-u_xlat16_2.xyz);
					    u_xlat16_16 = u_xlat16_3.w * u_xlat16_3.w;
					    u_xlat16_16 = min(u_xlat16_16, 1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_16);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_2.xyz;
					    u_xlat16_1.x = (-u_xlat16_0.w) + u_xlat16_3.w;
					    u_xlat16_3 = u_xlat16_3 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_2.w = u_xlat16_16 * u_xlat16_1.x + u_xlat16_0.w;
					    u_xlat16_0 = u_xlat16_2 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_3;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_1);
					    SV_Target0 = u_xlat16_1.wwww * u_xlat16_0 + u_xlat16_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _TapLowBackground;
					uniform mediump sampler2D _TapMedium;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat16_0 = texture(_TapMedium, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(1.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3 = texture(_TapLowBackground, vs_TEXCOORD0.xy);
					    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(0.0, 1.0, 0.0);
					    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + (-u_xlat16_2.xyz);
					    u_xlat16_16 = u_xlat16_3.w * u_xlat16_3.w;
					    u_xlat16_16 = min(u_xlat16_16, 1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_16);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_2.xyz;
					    u_xlat16_1.x = (-u_xlat16_0.w) + u_xlat16_3.w;
					    u_xlat16_3 = u_xlat16_3 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_2.w = u_xlat16_16 * u_xlat16_1.x + u_xlat16_0.w;
					    u_xlat16_0 = u_xlat16_2 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_3;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_1);
					    SV_Target0 = u_xlat16_1.wwww * u_xlat16_0 + u_xlat16_1;
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
		Pass {
			ColorMask A -1
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 205488
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat16_1 = _CurveParams.z + _CurveParams.w;
					    u_xlat2 = u_xlat0 + (-u_xlat16_1);
					    u_xlatb0 = u_xlat16_1<u_xlat0;
					    u_xlat2 = u_xlat2 * _CurveParams.y;
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    SV_Target0 = (bool(u_xlatb0)) ? vec4(u_xlat2) : vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat16_1 = _CurveParams.z + _CurveParams.w;
					    u_xlat2 = u_xlat0 + (-u_xlat16_1);
					    u_xlatb0 = u_xlat16_1<u_xlat0;
					    u_xlat2 = u_xlat2 * _CurveParams.y;
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    SV_Target0 = (bool(u_xlatb0)) ? vec4(u_xlat2) : vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat16_1 = _CurveParams.z + _CurveParams.w;
					    u_xlat2 = u_xlat0 + (-u_xlat16_1);
					    u_xlatb0 = u_xlat16_1<u_xlat0;
					    u_xlat2 = u_xlat2 * _CurveParams.y;
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    SV_Target0 = (bool(u_xlatb0)) ? vec4(u_xlat2) : vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					float u_xlat0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat16_1 = _CurveParams.z + _CurveParams.w;
					    u_xlat2 = u_xlat0 + (-u_xlat16_1);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<u_xlat0);
					#else
					    u_xlatb0 = u_xlat16_1<u_xlat0;
					#endif
					    u_xlat2 = u_xlat2 * _CurveParams.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
					#else
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					#endif
					    SV_Target0 = (bool(u_xlatb0)) ? vec4(u_xlat2) : vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					float u_xlat0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat16_1 = _CurveParams.z + _CurveParams.w;
					    u_xlat2 = u_xlat0 + (-u_xlat16_1);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<u_xlat0);
					#else
					    u_xlatb0 = u_xlat16_1<u_xlat0;
					#endif
					    u_xlat2 = u_xlat2 * _CurveParams.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
					#else
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					#endif
					    SV_Target0 = (bool(u_xlatb0)) ? vec4(u_xlat2) : vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					float u_xlat0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat16_1 = _CurveParams.z + _CurveParams.w;
					    u_xlat2 = u_xlat0 + (-u_xlat16_1);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<u_xlat0);
					#else
					    u_xlatb0 = u_xlat16_1<u_xlat0;
					#endif
					    u_xlat2 = u_xlat2 * _CurveParams.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
					#else
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					#endif
					    SV_Target0 = (bool(u_xlatb0)) ? vec4(u_xlat2) : vec4(0.0, 0.0, 0.0, 0.0);
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
		Pass {
			ColorMask RGB -1
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 301151
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	mediump float _ForegroundBlurExtrude;
					uniform lowp sampler2D _TapLowForeground;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapLowForeground, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat10_0.w * _ForegroundBlurExtrude;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = max(u_xlat16_1, u_xlat10_2.w);
					    u_xlat16_3.w = (-u_xlat10_2.w) + u_xlat16_1;
					    u_xlat16_1 = u_xlat16_1;
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					    u_xlat16_3.xyz = u_xlat10_0.xyz + (-u_xlat10_2.xyz);
					    SV_Target0 = vec4(u_xlat16_1) * u_xlat16_3 + u_xlat10_2;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	mediump float _ForegroundBlurExtrude;
					uniform lowp sampler2D _TapLowForeground;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapLowForeground, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat10_0.w * _ForegroundBlurExtrude;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = max(u_xlat16_1, u_xlat10_2.w);
					    u_xlat16_3.w = (-u_xlat10_2.w) + u_xlat16_1;
					    u_xlat16_1 = u_xlat16_1;
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					    u_xlat16_3.xyz = u_xlat10_0.xyz + (-u_xlat10_2.xyz);
					    SV_Target0 = vec4(u_xlat16_1) * u_xlat16_3 + u_xlat10_2;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	mediump float _ForegroundBlurExtrude;
					uniform lowp sampler2D _TapLowForeground;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapLowForeground, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat10_0.w * _ForegroundBlurExtrude;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = max(u_xlat16_1, u_xlat10_2.w);
					    u_xlat16_3.w = (-u_xlat10_2.w) + u_xlat16_1;
					    u_xlat16_1 = u_xlat16_1;
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					    u_xlat16_3.xyz = u_xlat10_0.xyz + (-u_xlat10_2.xyz);
					    SV_Target0 = vec4(u_xlat16_1) * u_xlat16_3 + u_xlat10_2;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _ForegroundBlurExtrude;
					uniform mediump sampler2D _TapLowForeground;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump float u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = texture(_TapLowForeground, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat16_0.w * _ForegroundBlurExtrude;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = max(u_xlat16_1, u_xlat16_2.w);
					    u_xlat16_3.w = (-u_xlat16_2.w) + u_xlat16_1;
					    u_xlat16_1 = u_xlat16_1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
					#else
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					#endif
					    u_xlat16_3.xyz = u_xlat16_0.xyz + (-u_xlat16_2.xyz);
					    SV_Target0 = vec4(u_xlat16_1) * u_xlat16_3 + u_xlat16_2;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _ForegroundBlurExtrude;
					uniform mediump sampler2D _TapLowForeground;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump float u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = texture(_TapLowForeground, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat16_0.w * _ForegroundBlurExtrude;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = max(u_xlat16_1, u_xlat16_2.w);
					    u_xlat16_3.w = (-u_xlat16_2.w) + u_xlat16_1;
					    u_xlat16_1 = u_xlat16_1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
					#else
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					#endif
					    u_xlat16_3.xyz = u_xlat16_0.xyz + (-u_xlat16_2.xyz);
					    SV_Target0 = vec4(u_xlat16_1) * u_xlat16_3 + u_xlat16_2;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _ForegroundBlurExtrude;
					uniform mediump sampler2D _TapLowForeground;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump float u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = texture(_TapLowForeground, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat16_0.w * _ForegroundBlurExtrude;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = max(u_xlat16_1, u_xlat16_2.w);
					    u_xlat16_3.w = (-u_xlat16_2.w) + u_xlat16_1;
					    u_xlat16_1 = u_xlat16_1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
					#else
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					#endif
					    u_xlat16_3.xyz = u_xlat16_0.xyz + (-u_xlat16_2.xyz);
					    SV_Target0 = vec4(u_xlat16_1) * u_xlat16_3 + u_xlat16_2;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 334352
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _CurveParams;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat16_1 = (-_CurveParams.z) + _CurveParams.w;
					    u_xlat2 = (-u_xlat0) + u_xlat16_1;
					    u_xlatb0 = u_xlat0<u_xlat16_1;
					    u_xlat2 = u_xlat2 * _CurveParams.x;
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    SV_Target0.w = (u_xlatb0) ? u_xlat2 : 0.0;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _CurveParams;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat16_1 = (-_CurveParams.z) + _CurveParams.w;
					    u_xlat2 = (-u_xlat0) + u_xlat16_1;
					    u_xlatb0 = u_xlat0<u_xlat16_1;
					    u_xlat2 = u_xlat2 * _CurveParams.x;
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    SV_Target0.w = (u_xlatb0) ? u_xlat2 : 0.0;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _CurveParams;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat16_1 = (-_CurveParams.z) + _CurveParams.w;
					    u_xlat2 = (-u_xlat0) + u_xlat16_1;
					    u_xlatb0 = u_xlat0<u_xlat16_1;
					    u_xlat2 = u_xlat2 * _CurveParams.x;
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    SV_Target0.w = (u_xlatb0) ? u_xlat2 : 0.0;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _CurveParams;
					uniform mediump sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					float u_xlat0;
					mediump vec3 u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat16_1 = (-_CurveParams.z) + _CurveParams.w;
					    u_xlat2 = (-u_xlat0) + u_xlat16_1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0<u_xlat16_1);
					#else
					    u_xlatb0 = u_xlat0<u_xlat16_1;
					#endif
					    u_xlat2 = u_xlat2 * _CurveParams.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
					#else
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					#endif
					    SV_Target0.w = (u_xlatb0) ? u_xlat2 : 0.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _CurveParams;
					uniform mediump sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					float u_xlat0;
					mediump vec3 u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat16_1 = (-_CurveParams.z) + _CurveParams.w;
					    u_xlat2 = (-u_xlat0) + u_xlat16_1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0<u_xlat16_1);
					#else
					    u_xlatb0 = u_xlat0<u_xlat16_1;
					#endif
					    u_xlat2 = u_xlat2 * _CurveParams.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
					#else
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					#endif
					    SV_Target0.w = (u_xlatb0) ? u_xlat2 : 0.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _CurveParams;
					uniform mediump sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					float u_xlat0;
					mediump vec3 u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat16_1 = (-_CurveParams.z) + _CurveParams.w;
					    u_xlat2 = (-u_xlat0) + u_xlat16_1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0<u_xlat16_1);
					#else
					    u_xlatb0 = u_xlat0<u_xlat16_1;
					#endif
					    u_xlat2 = u_xlat2 * _CurveParams.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
					#else
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					#endif
					    SV_Target0.w = (u_xlatb0) ? u_xlat2 : 0.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 444168
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec2 _InvRenderTargetSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.xy = in_TEXCOORD0.xy + (-_InvRenderTargetSize.xy);
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    u_xlat0.xy = _InvRenderTargetSize.xy * vec2(1.0, -1.0) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = u_xlat0.xy;
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
					uniform 	vec2 _InvRenderTargetSize;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					mediump vec2 u_xlat16_3;
					mediump vec2 u_xlat16_11;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_14 = max(u_xlat10_0.w, u_xlat10_1.w);
					    u_xlat0.x = 0.0;
					    u_xlat0.y = _InvRenderTargetSize.y;
					    u_xlat16_3.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD1.xy;
					    u_xlat16_11.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD2.xy;
					    u_xlat10_0 = texture2D(_MainTex, u_xlat16_11.xy);
					    u_xlat10_1 = texture2D(_MainTex, u_xlat16_3.xy);
					    u_xlat16_2.xyz = u_xlat10_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_3.x = max(u_xlat10_0.w, u_xlat10_1.w);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
					    SV_Target0.w = max(u_xlat16_14, u_xlat16_3.x);
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_0.xyz;
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec2 _InvRenderTargetSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.xy = in_TEXCOORD0.xy + (-_InvRenderTargetSize.xy);
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    u_xlat0.xy = _InvRenderTargetSize.xy * vec2(1.0, -1.0) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = u_xlat0.xy;
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
					uniform 	vec2 _InvRenderTargetSize;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					mediump vec2 u_xlat16_3;
					mediump vec2 u_xlat16_11;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_14 = max(u_xlat10_0.w, u_xlat10_1.w);
					    u_xlat0.x = 0.0;
					    u_xlat0.y = _InvRenderTargetSize.y;
					    u_xlat16_3.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD1.xy;
					    u_xlat16_11.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD2.xy;
					    u_xlat10_0 = texture2D(_MainTex, u_xlat16_11.xy);
					    u_xlat10_1 = texture2D(_MainTex, u_xlat16_3.xy);
					    u_xlat16_2.xyz = u_xlat10_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_3.x = max(u_xlat10_0.w, u_xlat10_1.w);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
					    SV_Target0.w = max(u_xlat16_14, u_xlat16_3.x);
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_0.xyz;
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec2 _InvRenderTargetSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.xy = in_TEXCOORD0.xy + (-_InvRenderTargetSize.xy);
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    u_xlat0.xy = _InvRenderTargetSize.xy * vec2(1.0, -1.0) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = u_xlat0.xy;
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
					uniform 	vec2 _InvRenderTargetSize;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					mediump vec2 u_xlat16_3;
					mediump vec2 u_xlat16_11;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_14 = max(u_xlat10_0.w, u_xlat10_1.w);
					    u_xlat0.x = 0.0;
					    u_xlat0.y = _InvRenderTargetSize.y;
					    u_xlat16_3.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD1.xy;
					    u_xlat16_11.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD2.xy;
					    u_xlat10_0 = texture2D(_MainTex, u_xlat16_11.xy);
					    u_xlat10_1 = texture2D(_MainTex, u_xlat16_3.xy);
					    u_xlat16_2.xyz = u_xlat10_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_3.x = max(u_xlat10_0.w, u_xlat10_1.w);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
					    SV_Target0.w = max(u_xlat16_14, u_xlat16_3.x);
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_0.xyz;
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec2 _InvRenderTargetSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.xy = in_TEXCOORD0.xy + (-_InvRenderTargetSize.xy);
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    u_xlat0.xy = _InvRenderTargetSize.xy * vec2(1.0, -1.0) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = u_xlat0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec2 _InvRenderTargetSize;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec2 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec2 u_xlat16_3;
					mediump vec2 u_xlat16_11;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_1.xyz;
					    u_xlat16_14 = max(u_xlat16_0.w, u_xlat16_1.w);
					    u_xlat0.x = 0.0;
					    u_xlat0.y = _InvRenderTargetSize.y;
					    u_xlat16_3.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD1.xy;
					    u_xlat16_11.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD2.xy;
					    u_xlat16_0 = texture(_MainTex, u_xlat16_11.xy);
					    u_xlat16_1 = texture(_MainTex, u_xlat16_3.xy);
					    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_3.x = max(u_xlat16_0.w, u_xlat16_1.w);
					    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
					    SV_Target0.w = max(u_xlat16_14, u_xlat16_3.x);
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec2 _InvRenderTargetSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.xy = in_TEXCOORD0.xy + (-_InvRenderTargetSize.xy);
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    u_xlat0.xy = _InvRenderTargetSize.xy * vec2(1.0, -1.0) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = u_xlat0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec2 _InvRenderTargetSize;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec2 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec2 u_xlat16_3;
					mediump vec2 u_xlat16_11;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_1.xyz;
					    u_xlat16_14 = max(u_xlat16_0.w, u_xlat16_1.w);
					    u_xlat0.x = 0.0;
					    u_xlat0.y = _InvRenderTargetSize.y;
					    u_xlat16_3.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD1.xy;
					    u_xlat16_11.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD2.xy;
					    u_xlat16_0 = texture(_MainTex, u_xlat16_11.xy);
					    u_xlat16_1 = texture(_MainTex, u_xlat16_3.xy);
					    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_3.x = max(u_xlat16_0.w, u_xlat16_1.w);
					    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
					    SV_Target0.w = max(u_xlat16_14, u_xlat16_3.x);
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec2 _InvRenderTargetSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.xy = in_TEXCOORD0.xy + (-_InvRenderTargetSize.xy);
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    u_xlat0.xy = _InvRenderTargetSize.xy * vec2(1.0, -1.0) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = u_xlat0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec2 _InvRenderTargetSize;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec2 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec2 u_xlat16_3;
					mediump vec2 u_xlat16_11;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_1.xyz;
					    u_xlat16_14 = max(u_xlat16_0.w, u_xlat16_1.w);
					    u_xlat0.x = 0.0;
					    u_xlat0.y = _InvRenderTargetSize.y;
					    u_xlat16_3.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD1.xy;
					    u_xlat16_11.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD2.xy;
					    u_xlat16_0 = texture(_MainTex, u_xlat16_11.xy);
					    u_xlat16_1 = texture(_MainTex, u_xlat16_3.xy);
					    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_3.x = max(u_xlat16_0.w, u_xlat16_1.w);
					    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
					    SV_Target0.w = max(u_xlat16_14, u_xlat16_3.x);
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 468078
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					layout(location = 0) out mediump vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					layout(location = 0) out mediump vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					layout(location = 0) out mediump vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
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
		Pass {
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ColorMask RGB -1
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 551005
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat16_0;
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
		Pass {
			Blend One One, One One
			ColorMask RGB -1
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 633898
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
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
					uniform 	mediump vec3 _Threshhold;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat10_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat10_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat10_1.ww + _Threshhold.xxyz.yz;
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * (-u_xlat10_1) + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
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
					uniform 	mediump vec3 _Threshhold;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat10_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat10_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat10_1.ww + _Threshhold.xxyz.yz;
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * (-u_xlat10_1) + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
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
					uniform 	mediump vec3 _Threshhold;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat10_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat10_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat10_1.ww + _Threshhold.xxyz.yz;
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * (-u_xlat10_1) + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
					out mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec3 _Threshhold;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					in mediump vec4 vs_TEXCOORD3;
					in mediump vec4 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat16_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
					#else
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					#endif
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat16_1.ww + _Threshhold.xxyz.yz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
					#else
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					#endif
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * (-u_xlat16_1) + u_xlat16_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
					out mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec3 _Threshhold;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					in mediump vec4 vs_TEXCOORD3;
					in mediump vec4 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat16_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
					#else
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					#endif
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat16_1.ww + _Threshhold.xxyz.yz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
					#else
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					#endif
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * (-u_xlat16_1) + u_xlat16_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
					out mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec3 _Threshhold;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					in mediump vec4 vs_TEXCOORD3;
					in mediump vec4 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat16_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
					#else
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					#endif
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat16_1.ww + _Threshhold.xxyz.yz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
					#else
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					#endif
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * (-u_xlat16_1) + u_xlat16_1;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 692963
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
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
					uniform 	mediump vec3 _Threshhold;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat10_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat10_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat10_1.ww + _Threshhold.xxyz.yz;
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    u_xlat16_7.xyz = u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
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
					uniform 	mediump vec3 _Threshhold;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat10_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat10_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat10_1.ww + _Threshhold.xxyz.yz;
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    u_xlat16_7.xyz = u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
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
					uniform 	mediump vec3 _Threshhold;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat10_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat10_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat10_1.ww + _Threshhold.xxyz.yz;
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    u_xlat16_7.xyz = u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
					out mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec3 _Threshhold;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					in mediump vec4 vs_TEXCOORD3;
					in mediump vec4 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat16_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
					#else
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					#endif
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat16_1.ww + _Threshhold.xxyz.yz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
					#else
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					#endif
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    u_xlat16_7.xyz = u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat16_1.w;
					    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
					out mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec3 _Threshhold;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					in mediump vec4 vs_TEXCOORD3;
					in mediump vec4 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat16_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
					#else
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					#endif
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat16_1.ww + _Threshhold.xxyz.yz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
					#else
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					#endif
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    u_xlat16_7.xyz = u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat16_1.w;
					    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
					out mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec3 _Threshhold;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					in mediump vec4 vs_TEXCOORD3;
					in mediump vec4 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat16_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
					#else
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					#endif
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat16_1.ww + _Threshhold.xxyz.yz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
					#else
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					#endif
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    u_xlat16_7.xyz = u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat16_1.w;
					    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 732101
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
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
					uniform 	mediump vec3 _Threshhold;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat10_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat10_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat10_1.ww + _Threshhold.xxyz.yz;
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * (-u_xlat10_1) + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
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
					uniform 	mediump vec3 _Threshhold;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat10_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat10_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat10_1.ww + _Threshhold.xxyz.yz;
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * (-u_xlat10_1) + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
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
					uniform 	mediump vec3 _Threshhold;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat10_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat10_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat10_1.ww + _Threshhold.xxyz.yz;
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * (-u_xlat10_1) + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
					out mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec3 _Threshhold;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					in mediump vec4 vs_TEXCOORD3;
					in mediump vec4 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat16_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
					#else
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					#endif
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat16_1.ww + _Threshhold.xxyz.yz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
					#else
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					#endif
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * (-u_xlat16_1) + u_xlat16_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
					out mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec3 _Threshhold;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					in mediump vec4 vs_TEXCOORD3;
					in mediump vec4 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat16_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
					#else
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					#endif
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat16_1.ww + _Threshhold.xxyz.yz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
					#else
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					#endif
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * (-u_xlat16_1) + u_xlat16_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
					out mediump vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.5, -7.5, -2.5, 7.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-1.5, 4.5, 1.5, -4.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD1 = u_xlat1;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-7.5, -2.5, 7.5, 2.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw;
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(4.5, 1.5, -4.5, -1.5) + in_TEXCOORD0.xyxy;
					    u_xlat1.zw = u_xlat2.xy;
					    u_xlat0.zw = u_xlat2.zw;
					    vs_TEXCOORD4 = u_xlat0;
					    vs_TEXCOORD3 = u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec3 _Threshhold;
					uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					in mediump vec4 vs_TEXCOORD3;
					in mediump vec4 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_7;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
					    u_xlat16_0 = u_xlat16_1 * vec4(0.125, 0.125, 0.125, 0.125) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat16_0.w + (-u_xlat16_1.w);
					    u_xlat16_7.x = _Threshhold.xxyz.w * 100.0;
					    u_xlat16_3.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
					#else
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					#endif
					    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz + (-u_xlat16_3.xyz);
					    u_xlat16_3.x = dot(abs(u_xlat16_3.xyz), vec3(0.300000012, 0.5, 0.200000003));
					    u_xlat16_3.y = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xy = (-u_xlat16_3.xy) * u_xlat16_1.ww + _Threshhold.xxyz.yz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
					#else
					    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
					#endif
					    u_xlat16_3.x = dot(u_xlat16_3.xy, vec2(1000.0, 1000.0));
					    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
					    SV_Target0 = u_xlat16_3.xxxx * (-u_xlat16_1) + u_xlat16_1;
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