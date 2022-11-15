Shader "Hidden/HexBokeh" {
	Properties {
		_MainTex ("-", 2D) = "black" {}
		_BlurTex1 ("-", 2D) = "black" {}
		_BlurTex2 ("-", 2D) = "black" {}
	}
	SubShader {
		Pass {
			ColorMask A -1
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 11820
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					#ifdef UNITY_ADRENO_ES3
					    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
					#else
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					#endif
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					#ifdef UNITY_ADRENO_ES3
					    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
					#else
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					#endif
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					#ifdef UNITY_ADRENO_ES3
					    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
					#else
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					#endif
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					#ifdef UNITY_ADRENO_ES3
					    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
					#else
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					#endif
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					#ifdef UNITY_ADRENO_ES3
					    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
					#else
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					#endif
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					#ifdef UNITY_ADRENO_ES3
					    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
					#else
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					#endif
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = abs(u_xlat1) * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = abs(u_xlat1) * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = abs(u_xlat1) * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = abs(u_xlat1) * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					#ifdef UNITY_ADRENO_ES3
					    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
					#else
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					#endif
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = abs(u_xlat1) * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					#ifdef UNITY_ADRENO_ES3
					    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
					#else
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					#endif
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = abs(u_xlat1) * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					#ifdef UNITY_ADRENO_ES3
					    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
					#else
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					#endif
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = abs(u_xlat1) * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = abs(u_xlat1) * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = abs(u_xlat1) * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = abs(u_xlat1) * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					#ifdef UNITY_ADRENO_ES3
					    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
					#else
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					#endif
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = abs(u_xlat1) * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					#ifdef UNITY_ADRENO_ES3
					    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
					#else
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					#endif
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec3 _CurveParams;
					uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat0 = _ZBufferParams.x * u_xlat0 + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat1 = u_xlat0 + (-_CurveParams.z);
					    u_xlat0 = u_xlat0 + 9.99999975e-06;
					    u_xlat1 = abs(u_xlat1) * _CurveParams.y;
					    u_xlat0 = u_xlat1 / u_xlat0;
					    SV_Target0.w = u_xlat0 + (-_CurveParams.x);
					#ifdef UNITY_ADRENO_ES3
					    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
					#else
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					#endif
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 108862
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat10_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat10_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat10_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat16_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat16_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat16_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat10_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat10_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat10_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat16_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat16_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat16_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat10_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat10_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat10_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat16_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat16_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat16_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat10_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat10_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat10_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat16_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat16_0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0 = vec4(u_xlat16_0);
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 182561
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
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
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					lowp vec4 u_xlat10_3;
					bool u_xlatb3;
					vec4 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat7;
					float u_xlat10;
					bool u_xlatb10;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.x = min(u_xlat10_1.w, u_xlat2.w);
					    u_xlat1 = u_xlat10_1 + u_xlat2;
					    u_xlatb3 = 0.142857149<u_xlat3.x;
					    u_xlat1 = (bool(u_xlatb3)) ? u_xlat1 : u_xlat2;
					    u_xlat2.xy = (bool(u_xlatb3)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat3 = u_xlat10_0 + u_xlat1;
					    u_xlat0 = min(u_xlat10_0.w, u_xlat2.w);
					    u_xlatb0 = 0.142857149<u_xlat0;
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat3 : u_xlat1;
					    u_xlat0 = (u_xlatb0) ? u_xlat2.y : u_xlat2.x;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat4 = u_xlat1 + u_xlat10_3;
					    u_xlat5 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlatb5 = 0.285714298<u_xlat5;
					    u_xlat1 = (bool(u_xlatb5)) ? u_xlat4 : u_xlat1;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat4 = u_xlat1 + u_xlat10_3;
					    u_xlat10 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlatb10 = 0.285714298<u_xlat10;
					    u_xlat1 = (bool(u_xlatb10)) ? u_xlat4 : u_xlat1;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat4 = u_xlat1 + u_xlat10_3;
					    u_xlat15 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlatb15 = 0.428571433<u_xlat15;
					    u_xlat1 = (bool(u_xlatb15)) ? u_xlat4 : u_xlat1;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat4 = u_xlat1 + u_xlat10_3;
					    u_xlat2.x = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat4 : u_xlat1;
					    u_xlat7 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb5) ? u_xlat7 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb10) ? u_xlat5 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat5 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb2) ? u_xlat5 : u_xlat0;
					    SV_Target0 = u_xlat1 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
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
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					lowp vec4 u_xlat10_3;
					bool u_xlatb3;
					vec4 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat7;
					float u_xlat10;
					bool u_xlatb10;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.x = min(u_xlat10_1.w, u_xlat2.w);
					    u_xlat1 = u_xlat10_1 + u_xlat2;
					    u_xlatb3 = 0.142857149<u_xlat3.x;
					    u_xlat1 = (bool(u_xlatb3)) ? u_xlat1 : u_xlat2;
					    u_xlat2.xy = (bool(u_xlatb3)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat3 = u_xlat10_0 + u_xlat1;
					    u_xlat0 = min(u_xlat10_0.w, u_xlat2.w);
					    u_xlatb0 = 0.142857149<u_xlat0;
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat3 : u_xlat1;
					    u_xlat0 = (u_xlatb0) ? u_xlat2.y : u_xlat2.x;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat4 = u_xlat1 + u_xlat10_3;
					    u_xlat5 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlatb5 = 0.285714298<u_xlat5;
					    u_xlat1 = (bool(u_xlatb5)) ? u_xlat4 : u_xlat1;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat4 = u_xlat1 + u_xlat10_3;
					    u_xlat10 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlatb10 = 0.285714298<u_xlat10;
					    u_xlat1 = (bool(u_xlatb10)) ? u_xlat4 : u_xlat1;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat4 = u_xlat1 + u_xlat10_3;
					    u_xlat15 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlatb15 = 0.428571433<u_xlat15;
					    u_xlat1 = (bool(u_xlatb15)) ? u_xlat4 : u_xlat1;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat4 = u_xlat1 + u_xlat10_3;
					    u_xlat2.x = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat4 : u_xlat1;
					    u_xlat7 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb5) ? u_xlat7 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb10) ? u_xlat5 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat5 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb2) ? u_xlat5 : u_xlat0;
					    SV_Target0 = u_xlat1 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
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
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					lowp vec4 u_xlat10_3;
					bool u_xlatb3;
					vec4 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat7;
					float u_xlat10;
					bool u_xlatb10;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.x = min(u_xlat10_1.w, u_xlat2.w);
					    u_xlat1 = u_xlat10_1 + u_xlat2;
					    u_xlatb3 = 0.142857149<u_xlat3.x;
					    u_xlat1 = (bool(u_xlatb3)) ? u_xlat1 : u_xlat2;
					    u_xlat2.xy = (bool(u_xlatb3)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat3 = u_xlat10_0 + u_xlat1;
					    u_xlat0 = min(u_xlat10_0.w, u_xlat2.w);
					    u_xlatb0 = 0.142857149<u_xlat0;
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat3 : u_xlat1;
					    u_xlat0 = (u_xlatb0) ? u_xlat2.y : u_xlat2.x;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat4 = u_xlat1 + u_xlat10_3;
					    u_xlat5 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlatb5 = 0.285714298<u_xlat5;
					    u_xlat1 = (bool(u_xlatb5)) ? u_xlat4 : u_xlat1;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat4 = u_xlat1 + u_xlat10_3;
					    u_xlat10 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlatb10 = 0.285714298<u_xlat10;
					    u_xlat1 = (bool(u_xlatb10)) ? u_xlat4 : u_xlat1;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat4 = u_xlat1 + u_xlat10_3;
					    u_xlat15 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlatb15 = 0.428571433<u_xlat15;
					    u_xlat1 = (bool(u_xlatb15)) ? u_xlat4 : u_xlat1;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat4 = u_xlat1 + u_xlat10_3;
					    u_xlat2.x = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat4 : u_xlat1;
					    u_xlat7 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb5) ? u_xlat7 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb10) ? u_xlat5 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat5 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb2) ? u_xlat5 : u_xlat0;
					    SV_Target0 = u_xlat1 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					mediump vec4 u_xlat16_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					bool u_xlatb3;
					vec4 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat7;
					float u_xlat10;
					bool u_xlatb10;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.x = min(u_xlat16_1.w, u_xlat2.w);
					    u_xlat1 = u_xlat16_1 + u_xlat2;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.142857149<u_xlat3.x);
					#else
					    u_xlatb3 = 0.142857149<u_xlat3.x;
					#endif
					    u_xlat1 = (bool(u_xlatb3)) ? u_xlat1 : u_xlat2;
					    u_xlat2.xy = (bool(u_xlatb3)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat3 = u_xlat16_0 + u_xlat1;
					    u_xlat0 = min(u_xlat16_0.w, u_xlat2.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.142857149<u_xlat0);
					#else
					    u_xlatb0 = 0.142857149<u_xlat0;
					#endif
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat3 : u_xlat1;
					    u_xlat0 = (u_xlatb0) ? u_xlat2.y : u_xlat2.x;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat4 = u_xlat1 + u_xlat16_3;
					    u_xlat5 = min(u_xlat2.w, u_xlat16_3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(0.285714298<u_xlat5);
					#else
					    u_xlatb5 = 0.285714298<u_xlat5;
					#endif
					    u_xlat1 = (bool(u_xlatb5)) ? u_xlat4 : u_xlat1;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat4 = u_xlat1 + u_xlat16_3;
					    u_xlat10 = min(u_xlat2.w, u_xlat16_3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(0.285714298<u_xlat10);
					#else
					    u_xlatb10 = 0.285714298<u_xlat10;
					#endif
					    u_xlat1 = (bool(u_xlatb10)) ? u_xlat4 : u_xlat1;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat4 = u_xlat1 + u_xlat16_3;
					    u_xlat15 = min(u_xlat2.w, u_xlat16_3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(0.428571433<u_xlat15);
					#else
					    u_xlatb15 = 0.428571433<u_xlat15;
					#endif
					    u_xlat1 = (bool(u_xlatb15)) ? u_xlat4 : u_xlat1;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat4 = u_xlat1 + u_xlat16_3;
					    u_xlat2.x = min(u_xlat2.w, u_xlat16_3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.428571433<u_xlat2.x);
					#else
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					#endif
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat4 : u_xlat1;
					    u_xlat7 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb5) ? u_xlat7 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb10) ? u_xlat5 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat5 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb2) ? u_xlat5 : u_xlat0;
					    SV_Target0 = u_xlat1 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					mediump vec4 u_xlat16_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					bool u_xlatb3;
					vec4 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat7;
					float u_xlat10;
					bool u_xlatb10;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.x = min(u_xlat16_1.w, u_xlat2.w);
					    u_xlat1 = u_xlat16_1 + u_xlat2;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.142857149<u_xlat3.x);
					#else
					    u_xlatb3 = 0.142857149<u_xlat3.x;
					#endif
					    u_xlat1 = (bool(u_xlatb3)) ? u_xlat1 : u_xlat2;
					    u_xlat2.xy = (bool(u_xlatb3)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat3 = u_xlat16_0 + u_xlat1;
					    u_xlat0 = min(u_xlat16_0.w, u_xlat2.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.142857149<u_xlat0);
					#else
					    u_xlatb0 = 0.142857149<u_xlat0;
					#endif
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat3 : u_xlat1;
					    u_xlat0 = (u_xlatb0) ? u_xlat2.y : u_xlat2.x;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat4 = u_xlat1 + u_xlat16_3;
					    u_xlat5 = min(u_xlat2.w, u_xlat16_3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(0.285714298<u_xlat5);
					#else
					    u_xlatb5 = 0.285714298<u_xlat5;
					#endif
					    u_xlat1 = (bool(u_xlatb5)) ? u_xlat4 : u_xlat1;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat4 = u_xlat1 + u_xlat16_3;
					    u_xlat10 = min(u_xlat2.w, u_xlat16_3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(0.285714298<u_xlat10);
					#else
					    u_xlatb10 = 0.285714298<u_xlat10;
					#endif
					    u_xlat1 = (bool(u_xlatb10)) ? u_xlat4 : u_xlat1;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat4 = u_xlat1 + u_xlat16_3;
					    u_xlat15 = min(u_xlat2.w, u_xlat16_3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(0.428571433<u_xlat15);
					#else
					    u_xlatb15 = 0.428571433<u_xlat15;
					#endif
					    u_xlat1 = (bool(u_xlatb15)) ? u_xlat4 : u_xlat1;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat4 = u_xlat1 + u_xlat16_3;
					    u_xlat2.x = min(u_xlat2.w, u_xlat16_3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.428571433<u_xlat2.x);
					#else
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					#endif
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat4 : u_xlat1;
					    u_xlat7 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb5) ? u_xlat7 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb10) ? u_xlat5 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat5 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb2) ? u_xlat5 : u_xlat0;
					    SV_Target0 = u_xlat1 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					mediump vec4 u_xlat16_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					bool u_xlatb3;
					vec4 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat7;
					float u_xlat10;
					bool u_xlatb10;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.x = min(u_xlat16_1.w, u_xlat2.w);
					    u_xlat1 = u_xlat16_1 + u_xlat2;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.142857149<u_xlat3.x);
					#else
					    u_xlatb3 = 0.142857149<u_xlat3.x;
					#endif
					    u_xlat1 = (bool(u_xlatb3)) ? u_xlat1 : u_xlat2;
					    u_xlat2.xy = (bool(u_xlatb3)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat3 = u_xlat16_0 + u_xlat1;
					    u_xlat0 = min(u_xlat16_0.w, u_xlat2.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.142857149<u_xlat0);
					#else
					    u_xlatb0 = 0.142857149<u_xlat0;
					#endif
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat3 : u_xlat1;
					    u_xlat0 = (u_xlatb0) ? u_xlat2.y : u_xlat2.x;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat4 = u_xlat1 + u_xlat16_3;
					    u_xlat5 = min(u_xlat2.w, u_xlat16_3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(0.285714298<u_xlat5);
					#else
					    u_xlatb5 = 0.285714298<u_xlat5;
					#endif
					    u_xlat1 = (bool(u_xlatb5)) ? u_xlat4 : u_xlat1;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat4 = u_xlat1 + u_xlat16_3;
					    u_xlat10 = min(u_xlat2.w, u_xlat16_3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(0.285714298<u_xlat10);
					#else
					    u_xlatb10 = 0.285714298<u_xlat10;
					#endif
					    u_xlat1 = (bool(u_xlatb10)) ? u_xlat4 : u_xlat1;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat4 = u_xlat1 + u_xlat16_3;
					    u_xlat15 = min(u_xlat2.w, u_xlat16_3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(0.428571433<u_xlat15);
					#else
					    u_xlatb15 = 0.428571433<u_xlat15;
					#endif
					    u_xlat1 = (bool(u_xlatb15)) ? u_xlat4 : u_xlat1;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat4 = u_xlat1 + u_xlat16_3;
					    u_xlat2.x = min(u_xlat2.w, u_xlat16_3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.428571433<u_xlat2.x);
					#else
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					#endif
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat4 : u_xlat1;
					    u_xlat7 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb5) ? u_xlat7 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb10) ? u_xlat5 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat5 : u_xlat0;
					    u_xlat5 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb2) ? u_xlat5 : u_xlat0;
					    SV_Target0 = u_xlat1 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD4;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD6 = u_xlat0 * vec4(6.0, 6.0, 6.0, 6.0) + in_TEXCOORD0.xyxy;
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
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD4;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					float u_xlat1;
					lowp vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					bool u_xlatb4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					bool u_xlatb7;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat19;
					bool u_xlatb19;
					float u_xlat21;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.x = min(u_xlat10_2.w, u_xlat3.w);
					    u_xlat2 = u_xlat10_2 + u_xlat3;
					    u_xlatb4 = 0.142857149<u_xlat4.x;
					    u_xlat2 = (bool(u_xlatb4)) ? u_xlat2 : u_xlat3;
					    u_xlat3.xy = (bool(u_xlatb4)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat4 = u_xlat10_1 + u_xlat2;
					    u_xlat1 = min(u_xlat10_1.w, u_xlat3.w);
					    u_xlatb1 = 0.142857149<u_xlat1;
					    u_xlat2 = (bool(u_xlatb1)) ? u_xlat4 : u_xlat2;
					    u_xlat1 = (u_xlatb1) ? u_xlat3.y : u_xlat3.x;
					    u_xlat4 = u_xlat10_0 + u_xlat2;
					    u_xlat0 = min(u_xlat10_0.w, u_xlat3.w);
					    u_xlatb0 = 0.285714298<u_xlat0;
					    u_xlat2 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat6 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb6 = 0.285714298<u_xlat6;
					    u_xlat2 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat12 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb12 = 0.428571433<u_xlat12;
					    u_xlat2 = (bool(u_xlatb12)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat18 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb18 = 0.428571433<u_xlat18;
					    u_xlat2 = (bool(u_xlatb18)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat7 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb7 = 0.571428597<u_xlat7;
					    u_xlat2 = (bool(u_xlatb7)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat13 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb13 = 0.571428597<u_xlat13;
					    u_xlat2 = (bool(u_xlatb13)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat19 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb19 = 0.714285731<u_xlat19;
					    u_xlat2 = (bool(u_xlatb19)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat3.x = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb3 = 0.714285731<u_xlat3.x;
					    u_xlat2 = (bool(u_xlatb3)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat9 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb9 = 0.857142866<u_xlat9;
					    u_xlat2 = (bool(u_xlatb9)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD6.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat15 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb15 = 0.857142866<u_xlat15;
					    u_xlat2 = (bool(u_xlatb15)) ? u_xlat5 : u_xlat2;
					    u_xlat21 = u_xlat1 + 1.0;
					    u_xlat0 = (u_xlatb0) ? u_xlat21 : u_xlat1;
					    u_xlat1 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb6) ? u_xlat1 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb12) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb18) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb7) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb13) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb19) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb3) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb9) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat6 : u_xlat0;
					    SV_Target0 = u_xlat2 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD4;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD6 = u_xlat0 * vec4(6.0, 6.0, 6.0, 6.0) + in_TEXCOORD0.xyxy;
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
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD4;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					float u_xlat1;
					lowp vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					bool u_xlatb4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					bool u_xlatb7;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat19;
					bool u_xlatb19;
					float u_xlat21;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.x = min(u_xlat10_2.w, u_xlat3.w);
					    u_xlat2 = u_xlat10_2 + u_xlat3;
					    u_xlatb4 = 0.142857149<u_xlat4.x;
					    u_xlat2 = (bool(u_xlatb4)) ? u_xlat2 : u_xlat3;
					    u_xlat3.xy = (bool(u_xlatb4)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat4 = u_xlat10_1 + u_xlat2;
					    u_xlat1 = min(u_xlat10_1.w, u_xlat3.w);
					    u_xlatb1 = 0.142857149<u_xlat1;
					    u_xlat2 = (bool(u_xlatb1)) ? u_xlat4 : u_xlat2;
					    u_xlat1 = (u_xlatb1) ? u_xlat3.y : u_xlat3.x;
					    u_xlat4 = u_xlat10_0 + u_xlat2;
					    u_xlat0 = min(u_xlat10_0.w, u_xlat3.w);
					    u_xlatb0 = 0.285714298<u_xlat0;
					    u_xlat2 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat6 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb6 = 0.285714298<u_xlat6;
					    u_xlat2 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat12 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb12 = 0.428571433<u_xlat12;
					    u_xlat2 = (bool(u_xlatb12)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat18 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb18 = 0.428571433<u_xlat18;
					    u_xlat2 = (bool(u_xlatb18)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat7 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb7 = 0.571428597<u_xlat7;
					    u_xlat2 = (bool(u_xlatb7)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat13 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb13 = 0.571428597<u_xlat13;
					    u_xlat2 = (bool(u_xlatb13)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat19 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb19 = 0.714285731<u_xlat19;
					    u_xlat2 = (bool(u_xlatb19)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat3.x = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb3 = 0.714285731<u_xlat3.x;
					    u_xlat2 = (bool(u_xlatb3)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat9 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb9 = 0.857142866<u_xlat9;
					    u_xlat2 = (bool(u_xlatb9)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD6.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat15 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb15 = 0.857142866<u_xlat15;
					    u_xlat2 = (bool(u_xlatb15)) ? u_xlat5 : u_xlat2;
					    u_xlat21 = u_xlat1 + 1.0;
					    u_xlat0 = (u_xlatb0) ? u_xlat21 : u_xlat1;
					    u_xlat1 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb6) ? u_xlat1 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb12) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb18) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb7) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb13) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb19) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb3) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb9) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat6 : u_xlat0;
					    SV_Target0 = u_xlat2 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD4;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD6 = u_xlat0 * vec4(6.0, 6.0, 6.0, 6.0) + in_TEXCOORD0.xyxy;
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
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD4;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					float u_xlat1;
					lowp vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					bool u_xlatb4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					bool u_xlatb7;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat19;
					bool u_xlatb19;
					float u_xlat21;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.x = min(u_xlat10_2.w, u_xlat3.w);
					    u_xlat2 = u_xlat10_2 + u_xlat3;
					    u_xlatb4 = 0.142857149<u_xlat4.x;
					    u_xlat2 = (bool(u_xlatb4)) ? u_xlat2 : u_xlat3;
					    u_xlat3.xy = (bool(u_xlatb4)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat4 = u_xlat10_1 + u_xlat2;
					    u_xlat1 = min(u_xlat10_1.w, u_xlat3.w);
					    u_xlatb1 = 0.142857149<u_xlat1;
					    u_xlat2 = (bool(u_xlatb1)) ? u_xlat4 : u_xlat2;
					    u_xlat1 = (u_xlatb1) ? u_xlat3.y : u_xlat3.x;
					    u_xlat4 = u_xlat10_0 + u_xlat2;
					    u_xlat0 = min(u_xlat10_0.w, u_xlat3.w);
					    u_xlatb0 = 0.285714298<u_xlat0;
					    u_xlat2 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat6 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb6 = 0.285714298<u_xlat6;
					    u_xlat2 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat12 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb12 = 0.428571433<u_xlat12;
					    u_xlat2 = (bool(u_xlatb12)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat18 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb18 = 0.428571433<u_xlat18;
					    u_xlat2 = (bool(u_xlatb18)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat7 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb7 = 0.571428597<u_xlat7;
					    u_xlat2 = (bool(u_xlatb7)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat13 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb13 = 0.571428597<u_xlat13;
					    u_xlat2 = (bool(u_xlatb13)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat19 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb19 = 0.714285731<u_xlat19;
					    u_xlat2 = (bool(u_xlatb19)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat3.x = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb3 = 0.714285731<u_xlat3.x;
					    u_xlat2 = (bool(u_xlatb3)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat9 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb9 = 0.857142866<u_xlat9;
					    u_xlat2 = (bool(u_xlatb9)) ? u_xlat5 : u_xlat2;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD6.zw);
					    u_xlat5 = u_xlat2 + u_xlat10_4;
					    u_xlat15 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlatb15 = 0.857142866<u_xlat15;
					    u_xlat2 = (bool(u_xlatb15)) ? u_xlat5 : u_xlat2;
					    u_xlat21 = u_xlat1 + 1.0;
					    u_xlat0 = (u_xlatb0) ? u_xlat21 : u_xlat1;
					    u_xlat1 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb6) ? u_xlat1 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb12) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb18) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb7) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb13) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb19) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb3) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb9) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat6 : u_xlat0;
					    SV_Target0 = u_xlat2 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD6 = u_xlat0 * vec4(6.0, 6.0, 6.0, 6.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					in highp vec4 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					in highp vec4 vs_TEXCOORD6;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					mediump vec4 u_xlat16_0;
					bool u_xlatb0;
					float u_xlat1;
					mediump vec4 u_xlat16_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					mediump vec4 u_xlat16_4;
					bool u_xlatb4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					bool u_xlatb7;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat19;
					bool u_xlatb19;
					float u_xlat21;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.x = min(u_xlat16_2.w, u_xlat3.w);
					    u_xlat2 = u_xlat16_2 + u_xlat3;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(0.142857149<u_xlat4.x);
					#else
					    u_xlatb4 = 0.142857149<u_xlat4.x;
					#endif
					    u_xlat2 = (bool(u_xlatb4)) ? u_xlat2 : u_xlat3;
					    u_xlat3.xy = (bool(u_xlatb4)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat4 = u_xlat16_1 + u_xlat2;
					    u_xlat1 = min(u_xlat16_1.w, u_xlat3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.142857149<u_xlat1);
					#else
					    u_xlatb1 = 0.142857149<u_xlat1;
					#endif
					    u_xlat2 = (bool(u_xlatb1)) ? u_xlat4 : u_xlat2;
					    u_xlat1 = (u_xlatb1) ? u_xlat3.y : u_xlat3.x;
					    u_xlat4 = u_xlat16_0 + u_xlat2;
					    u_xlat0 = min(u_xlat16_0.w, u_xlat3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.285714298<u_xlat0);
					#else
					    u_xlatb0 = 0.285714298<u_xlat0;
					#endif
					    u_xlat2 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat6 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.285714298<u_xlat6);
					#else
					    u_xlatb6 = 0.285714298<u_xlat6;
					#endif
					    u_xlat2 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat12 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(0.428571433<u_xlat12);
					#else
					    u_xlatb12 = 0.428571433<u_xlat12;
					#endif
					    u_xlat2 = (bool(u_xlatb12)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat18 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(0.428571433<u_xlat18);
					#else
					    u_xlatb18 = 0.428571433<u_xlat18;
					#endif
					    u_xlat2 = (bool(u_xlatb18)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat7 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(0.571428597<u_xlat7);
					#else
					    u_xlatb7 = 0.571428597<u_xlat7;
					#endif
					    u_xlat2 = (bool(u_xlatb7)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat13 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb13 = !!(0.571428597<u_xlat13);
					#else
					    u_xlatb13 = 0.571428597<u_xlat13;
					#endif
					    u_xlat2 = (bool(u_xlatb13)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat19 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb19 = !!(0.714285731<u_xlat19);
					#else
					    u_xlatb19 = 0.714285731<u_xlat19;
					#endif
					    u_xlat2 = (bool(u_xlatb19)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat3.x = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.714285731<u_xlat3.x);
					#else
					    u_xlatb3 = 0.714285731<u_xlat3.x;
					#endif
					    u_xlat2 = (bool(u_xlatb3)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat9 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(0.857142866<u_xlat9);
					#else
					    u_xlatb9 = 0.857142866<u_xlat9;
					#endif
					    u_xlat2 = (bool(u_xlatb9)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD6.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat15 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(0.857142866<u_xlat15);
					#else
					    u_xlatb15 = 0.857142866<u_xlat15;
					#endif
					    u_xlat2 = (bool(u_xlatb15)) ? u_xlat5 : u_xlat2;
					    u_xlat21 = u_xlat1 + 1.0;
					    u_xlat0 = (u_xlatb0) ? u_xlat21 : u_xlat1;
					    u_xlat1 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb6) ? u_xlat1 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb12) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb18) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb7) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb13) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb19) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb3) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb9) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat6 : u_xlat0;
					    SV_Target0 = u_xlat2 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD6 = u_xlat0 * vec4(6.0, 6.0, 6.0, 6.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					in highp vec4 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					in highp vec4 vs_TEXCOORD6;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					mediump vec4 u_xlat16_0;
					bool u_xlatb0;
					float u_xlat1;
					mediump vec4 u_xlat16_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					mediump vec4 u_xlat16_4;
					bool u_xlatb4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					bool u_xlatb7;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat19;
					bool u_xlatb19;
					float u_xlat21;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.x = min(u_xlat16_2.w, u_xlat3.w);
					    u_xlat2 = u_xlat16_2 + u_xlat3;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(0.142857149<u_xlat4.x);
					#else
					    u_xlatb4 = 0.142857149<u_xlat4.x;
					#endif
					    u_xlat2 = (bool(u_xlatb4)) ? u_xlat2 : u_xlat3;
					    u_xlat3.xy = (bool(u_xlatb4)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat4 = u_xlat16_1 + u_xlat2;
					    u_xlat1 = min(u_xlat16_1.w, u_xlat3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.142857149<u_xlat1);
					#else
					    u_xlatb1 = 0.142857149<u_xlat1;
					#endif
					    u_xlat2 = (bool(u_xlatb1)) ? u_xlat4 : u_xlat2;
					    u_xlat1 = (u_xlatb1) ? u_xlat3.y : u_xlat3.x;
					    u_xlat4 = u_xlat16_0 + u_xlat2;
					    u_xlat0 = min(u_xlat16_0.w, u_xlat3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.285714298<u_xlat0);
					#else
					    u_xlatb0 = 0.285714298<u_xlat0;
					#endif
					    u_xlat2 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat6 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.285714298<u_xlat6);
					#else
					    u_xlatb6 = 0.285714298<u_xlat6;
					#endif
					    u_xlat2 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat12 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(0.428571433<u_xlat12);
					#else
					    u_xlatb12 = 0.428571433<u_xlat12;
					#endif
					    u_xlat2 = (bool(u_xlatb12)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat18 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(0.428571433<u_xlat18);
					#else
					    u_xlatb18 = 0.428571433<u_xlat18;
					#endif
					    u_xlat2 = (bool(u_xlatb18)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat7 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(0.571428597<u_xlat7);
					#else
					    u_xlatb7 = 0.571428597<u_xlat7;
					#endif
					    u_xlat2 = (bool(u_xlatb7)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat13 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb13 = !!(0.571428597<u_xlat13);
					#else
					    u_xlatb13 = 0.571428597<u_xlat13;
					#endif
					    u_xlat2 = (bool(u_xlatb13)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat19 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb19 = !!(0.714285731<u_xlat19);
					#else
					    u_xlatb19 = 0.714285731<u_xlat19;
					#endif
					    u_xlat2 = (bool(u_xlatb19)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat3.x = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.714285731<u_xlat3.x);
					#else
					    u_xlatb3 = 0.714285731<u_xlat3.x;
					#endif
					    u_xlat2 = (bool(u_xlatb3)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat9 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(0.857142866<u_xlat9);
					#else
					    u_xlatb9 = 0.857142866<u_xlat9;
					#endif
					    u_xlat2 = (bool(u_xlatb9)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD6.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat15 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(0.857142866<u_xlat15);
					#else
					    u_xlatb15 = 0.857142866<u_xlat15;
					#endif
					    u_xlat2 = (bool(u_xlatb15)) ? u_xlat5 : u_xlat2;
					    u_xlat21 = u_xlat1 + 1.0;
					    u_xlat0 = (u_xlatb0) ? u_xlat21 : u_xlat1;
					    u_xlat1 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb6) ? u_xlat1 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb12) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb18) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb7) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb13) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb19) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb3) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb9) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat6 : u_xlat0;
					    SV_Target0 = u_xlat2 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD6 = u_xlat0 * vec4(6.0, 6.0, 6.0, 6.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					in highp vec4 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					in highp vec4 vs_TEXCOORD6;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					mediump vec4 u_xlat16_0;
					bool u_xlatb0;
					float u_xlat1;
					mediump vec4 u_xlat16_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					mediump vec4 u_xlat16_4;
					bool u_xlatb4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					bool u_xlatb7;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat19;
					bool u_xlatb19;
					float u_xlat21;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.x = min(u_xlat16_2.w, u_xlat3.w);
					    u_xlat2 = u_xlat16_2 + u_xlat3;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(0.142857149<u_xlat4.x);
					#else
					    u_xlatb4 = 0.142857149<u_xlat4.x;
					#endif
					    u_xlat2 = (bool(u_xlatb4)) ? u_xlat2 : u_xlat3;
					    u_xlat3.xy = (bool(u_xlatb4)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat4 = u_xlat16_1 + u_xlat2;
					    u_xlat1 = min(u_xlat16_1.w, u_xlat3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.142857149<u_xlat1);
					#else
					    u_xlatb1 = 0.142857149<u_xlat1;
					#endif
					    u_xlat2 = (bool(u_xlatb1)) ? u_xlat4 : u_xlat2;
					    u_xlat1 = (u_xlatb1) ? u_xlat3.y : u_xlat3.x;
					    u_xlat4 = u_xlat16_0 + u_xlat2;
					    u_xlat0 = min(u_xlat16_0.w, u_xlat3.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.285714298<u_xlat0);
					#else
					    u_xlatb0 = 0.285714298<u_xlat0;
					#endif
					    u_xlat2 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat6 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.285714298<u_xlat6);
					#else
					    u_xlatb6 = 0.285714298<u_xlat6;
					#endif
					    u_xlat2 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat12 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(0.428571433<u_xlat12);
					#else
					    u_xlatb12 = 0.428571433<u_xlat12;
					#endif
					    u_xlat2 = (bool(u_xlatb12)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat18 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(0.428571433<u_xlat18);
					#else
					    u_xlatb18 = 0.428571433<u_xlat18;
					#endif
					    u_xlat2 = (bool(u_xlatb18)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat7 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(0.571428597<u_xlat7);
					#else
					    u_xlatb7 = 0.571428597<u_xlat7;
					#endif
					    u_xlat2 = (bool(u_xlatb7)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat13 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb13 = !!(0.571428597<u_xlat13);
					#else
					    u_xlatb13 = 0.571428597<u_xlat13;
					#endif
					    u_xlat2 = (bool(u_xlatb13)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat19 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb19 = !!(0.714285731<u_xlat19);
					#else
					    u_xlatb19 = 0.714285731<u_xlat19;
					#endif
					    u_xlat2 = (bool(u_xlatb19)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat3.x = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.714285731<u_xlat3.x);
					#else
					    u_xlatb3 = 0.714285731<u_xlat3.x;
					#endif
					    u_xlat2 = (bool(u_xlatb3)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat9 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(0.857142866<u_xlat9);
					#else
					    u_xlatb9 = 0.857142866<u_xlat9;
					#endif
					    u_xlat2 = (bool(u_xlatb9)) ? u_xlat5 : u_xlat2;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD6.zw);
					    u_xlat5 = u_xlat2 + u_xlat16_4;
					    u_xlat15 = min(u_xlat3.w, u_xlat16_4.w);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(0.857142866<u_xlat15);
					#else
					    u_xlatb15 = 0.857142866<u_xlat15;
					#endif
					    u_xlat2 = (bool(u_xlatb15)) ? u_xlat5 : u_xlat2;
					    u_xlat21 = u_xlat1 + 1.0;
					    u_xlat0 = (u_xlatb0) ? u_xlat21 : u_xlat1;
					    u_xlat1 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb6) ? u_xlat1 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb12) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb18) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb7) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb13) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb19) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb3) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb9) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat6 : u_xlat0;
					    SV_Target0 = u_xlat2 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
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
					uniform highp sampler2D _CameraDepthTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					bool u_xlatb2;
					lowp vec4 u_xlat10_3;
					vec4 u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					float u_xlat11;
					bool u_xlatb11;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat1.x = texture2D(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat6 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlatb1 = u_xlat6>=u_xlat1.x;
					    u_xlat2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat11 = min(u_xlat10_0.w, u_xlat2.w);
					    u_xlat1.x = (u_xlatb1) ? u_xlat10_0.w : u_xlat11;
					    u_xlat0 = u_xlat10_0 + u_xlat2;
					    u_xlatb1 = 0.142857149<u_xlat1.x;
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
					    u_xlat1.xz = (bool(u_xlatb1)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat16 = texture2D(_CameraDepthTexture, vs_TEXCOORD1.zw).x;
					    u_xlatb16 = u_xlat6>=u_xlat16;
					    u_xlat2.x = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat16 = (u_xlatb16) ? u_xlat10_3.w : u_xlat2.x;
					    u_xlatb16 = 0.142857149<u_xlat16;
					    u_xlat0 = (bool(u_xlatb16)) ? u_xlat4 : u_xlat0;
					    u_xlat1.x = (u_xlatb16) ? u_xlat1.z : u_xlat1.x;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat11 = texture2D(_CameraDepthTexture, vs_TEXCOORD2.xy).x;
					    u_xlatb11 = u_xlat6>=u_xlat11;
					    u_xlat16 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat11 = (u_xlatb11) ? u_xlat10_3.w : u_xlat16;
					    u_xlatb11 = 0.285714298<u_xlat11;
					    u_xlat0 = (bool(u_xlatb11)) ? u_xlat4 : u_xlat0;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat16 = texture2D(_CameraDepthTexture, vs_TEXCOORD2.zw).x;
					    u_xlatb16 = u_xlat6>=u_xlat16;
					    u_xlat2.x = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat16 = (u_xlatb16) ? u_xlat10_3.w : u_xlat2.x;
					    u_xlatb16 = 0.285714298<u_xlat16;
					    u_xlat0 = (bool(u_xlatb16)) ? u_xlat4 : u_xlat0;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat2.x = texture2D(_CameraDepthTexture, vs_TEXCOORD3.xy).x;
					    u_xlatb2 = u_xlat6>=u_xlat2.x;
					    u_xlat7 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat10_3.w : u_xlat7;
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					    u_xlat0 = (bool(u_xlatb2)) ? u_xlat4 : u_xlat0;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat7 = texture2D(_CameraDepthTexture, vs_TEXCOORD3.zw).x;
					    u_xlatb6 = u_xlat6>=u_xlat7;
					    u_xlat7 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat6 = (u_xlatb6) ? u_xlat10_3.w : u_xlat7;
					    u_xlatb6 = 0.428571433<u_xlat6;
					    u_xlat0 = (bool(u_xlatb6)) ? u_xlat4 : u_xlat0;
					    u_xlat7 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb11) ? u_xlat7 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb16) ? u_xlat11 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb2) ? u_xlat11 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb6) ? u_xlat11 : u_xlat1.x;
					    SV_Target0 = u_xlat0 / u_xlat1.xxxx;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
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
					uniform highp sampler2D _CameraDepthTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					bool u_xlatb2;
					lowp vec4 u_xlat10_3;
					vec4 u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					float u_xlat11;
					bool u_xlatb11;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat1.x = texture2D(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat6 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlatb1 = u_xlat6>=u_xlat1.x;
					    u_xlat2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat11 = min(u_xlat10_0.w, u_xlat2.w);
					    u_xlat1.x = (u_xlatb1) ? u_xlat10_0.w : u_xlat11;
					    u_xlat0 = u_xlat10_0 + u_xlat2;
					    u_xlatb1 = 0.142857149<u_xlat1.x;
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
					    u_xlat1.xz = (bool(u_xlatb1)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat16 = texture2D(_CameraDepthTexture, vs_TEXCOORD1.zw).x;
					    u_xlatb16 = u_xlat6>=u_xlat16;
					    u_xlat2.x = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat16 = (u_xlatb16) ? u_xlat10_3.w : u_xlat2.x;
					    u_xlatb16 = 0.142857149<u_xlat16;
					    u_xlat0 = (bool(u_xlatb16)) ? u_xlat4 : u_xlat0;
					    u_xlat1.x = (u_xlatb16) ? u_xlat1.z : u_xlat1.x;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat11 = texture2D(_CameraDepthTexture, vs_TEXCOORD2.xy).x;
					    u_xlatb11 = u_xlat6>=u_xlat11;
					    u_xlat16 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat11 = (u_xlatb11) ? u_xlat10_3.w : u_xlat16;
					    u_xlatb11 = 0.285714298<u_xlat11;
					    u_xlat0 = (bool(u_xlatb11)) ? u_xlat4 : u_xlat0;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat16 = texture2D(_CameraDepthTexture, vs_TEXCOORD2.zw).x;
					    u_xlatb16 = u_xlat6>=u_xlat16;
					    u_xlat2.x = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat16 = (u_xlatb16) ? u_xlat10_3.w : u_xlat2.x;
					    u_xlatb16 = 0.285714298<u_xlat16;
					    u_xlat0 = (bool(u_xlatb16)) ? u_xlat4 : u_xlat0;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat2.x = texture2D(_CameraDepthTexture, vs_TEXCOORD3.xy).x;
					    u_xlatb2 = u_xlat6>=u_xlat2.x;
					    u_xlat7 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat10_3.w : u_xlat7;
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					    u_xlat0 = (bool(u_xlatb2)) ? u_xlat4 : u_xlat0;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat7 = texture2D(_CameraDepthTexture, vs_TEXCOORD3.zw).x;
					    u_xlatb6 = u_xlat6>=u_xlat7;
					    u_xlat7 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat6 = (u_xlatb6) ? u_xlat10_3.w : u_xlat7;
					    u_xlatb6 = 0.428571433<u_xlat6;
					    u_xlat0 = (bool(u_xlatb6)) ? u_xlat4 : u_xlat0;
					    u_xlat7 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb11) ? u_xlat7 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb16) ? u_xlat11 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb2) ? u_xlat11 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb6) ? u_xlat11 : u_xlat1.x;
					    SV_Target0 = u_xlat0 / u_xlat1.xxxx;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
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
					uniform highp sampler2D _CameraDepthTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					bool u_xlatb2;
					lowp vec4 u_xlat10_3;
					vec4 u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					float u_xlat11;
					bool u_xlatb11;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat1.x = texture2D(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat6 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlatb1 = u_xlat6>=u_xlat1.x;
					    u_xlat2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat11 = min(u_xlat10_0.w, u_xlat2.w);
					    u_xlat1.x = (u_xlatb1) ? u_xlat10_0.w : u_xlat11;
					    u_xlat0 = u_xlat10_0 + u_xlat2;
					    u_xlatb1 = 0.142857149<u_xlat1.x;
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
					    u_xlat1.xz = (bool(u_xlatb1)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat16 = texture2D(_CameraDepthTexture, vs_TEXCOORD1.zw).x;
					    u_xlatb16 = u_xlat6>=u_xlat16;
					    u_xlat2.x = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat16 = (u_xlatb16) ? u_xlat10_3.w : u_xlat2.x;
					    u_xlatb16 = 0.142857149<u_xlat16;
					    u_xlat0 = (bool(u_xlatb16)) ? u_xlat4 : u_xlat0;
					    u_xlat1.x = (u_xlatb16) ? u_xlat1.z : u_xlat1.x;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat11 = texture2D(_CameraDepthTexture, vs_TEXCOORD2.xy).x;
					    u_xlatb11 = u_xlat6>=u_xlat11;
					    u_xlat16 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat11 = (u_xlatb11) ? u_xlat10_3.w : u_xlat16;
					    u_xlatb11 = 0.285714298<u_xlat11;
					    u_xlat0 = (bool(u_xlatb11)) ? u_xlat4 : u_xlat0;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat16 = texture2D(_CameraDepthTexture, vs_TEXCOORD2.zw).x;
					    u_xlatb16 = u_xlat6>=u_xlat16;
					    u_xlat2.x = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat16 = (u_xlatb16) ? u_xlat10_3.w : u_xlat2.x;
					    u_xlatb16 = 0.285714298<u_xlat16;
					    u_xlat0 = (bool(u_xlatb16)) ? u_xlat4 : u_xlat0;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat2.x = texture2D(_CameraDepthTexture, vs_TEXCOORD3.xy).x;
					    u_xlatb2 = u_xlat6>=u_xlat2.x;
					    u_xlat7 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat10_3.w : u_xlat7;
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					    u_xlat0 = (bool(u_xlatb2)) ? u_xlat4 : u_xlat0;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat4 = u_xlat0 + u_xlat10_3;
					    u_xlat7 = texture2D(_CameraDepthTexture, vs_TEXCOORD3.zw).x;
					    u_xlatb6 = u_xlat6>=u_xlat7;
					    u_xlat7 = min(u_xlat2.w, u_xlat10_3.w);
					    u_xlat6 = (u_xlatb6) ? u_xlat10_3.w : u_xlat7;
					    u_xlatb6 = 0.428571433<u_xlat6;
					    u_xlat0 = (bool(u_xlatb6)) ? u_xlat4 : u_xlat0;
					    u_xlat7 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb11) ? u_xlat7 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb16) ? u_xlat11 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb2) ? u_xlat11 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb6) ? u_xlat11 : u_xlat1.x;
					    SV_Target0 = u_xlat0 / u_xlat1.xxxx;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					bool u_xlatb2;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					float u_xlat11;
					bool u_xlatb11;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat1.x = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat6 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat6>=u_xlat1.x);
					#else
					    u_xlatb1 = u_xlat6>=u_xlat1.x;
					#endif
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat11 = min(u_xlat16_0.w, u_xlat2.w);
					    u_xlat1.x = (u_xlatb1) ? u_xlat16_0.w : u_xlat11;
					    u_xlat0 = u_xlat16_0 + u_xlat2;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.142857149<u_xlat1.x);
					#else
					    u_xlatb1 = 0.142857149<u_xlat1.x;
					#endif
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
					    u_xlat1.xz = (bool(u_xlatb1)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat16 = texture(_CameraDepthTexture, vs_TEXCOORD1.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(u_xlat6>=u_xlat16);
					#else
					    u_xlatb16 = u_xlat6>=u_xlat16;
					#endif
					    u_xlat2.x = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat16 = (u_xlatb16) ? u_xlat16_3.w : u_xlat2.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(0.142857149<u_xlat16);
					#else
					    u_xlatb16 = 0.142857149<u_xlat16;
					#endif
					    u_xlat0 = (bool(u_xlatb16)) ? u_xlat4 : u_xlat0;
					    u_xlat1.x = (u_xlatb16) ? u_xlat1.z : u_xlat1.x;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat11 = texture(_CameraDepthTexture, vs_TEXCOORD2.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb11 = !!(u_xlat6>=u_xlat11);
					#else
					    u_xlatb11 = u_xlat6>=u_xlat11;
					#endif
					    u_xlat16 = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat11 = (u_xlatb11) ? u_xlat16_3.w : u_xlat16;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb11 = !!(0.285714298<u_xlat11);
					#else
					    u_xlatb11 = 0.285714298<u_xlat11;
					#endif
					    u_xlat0 = (bool(u_xlatb11)) ? u_xlat4 : u_xlat0;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat16 = texture(_CameraDepthTexture, vs_TEXCOORD2.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(u_xlat6>=u_xlat16);
					#else
					    u_xlatb16 = u_xlat6>=u_xlat16;
					#endif
					    u_xlat2.x = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat16 = (u_xlatb16) ? u_xlat16_3.w : u_xlat2.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(0.285714298<u_xlat16);
					#else
					    u_xlatb16 = 0.285714298<u_xlat16;
					#endif
					    u_xlat0 = (bool(u_xlatb16)) ? u_xlat4 : u_xlat0;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat2.x = texture(_CameraDepthTexture, vs_TEXCOORD3.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat6>=u_xlat2.x);
					#else
					    u_xlatb2 = u_xlat6>=u_xlat2.x;
					#endif
					    u_xlat7 = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat16_3.w : u_xlat7;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.428571433<u_xlat2.x);
					#else
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					#endif
					    u_xlat0 = (bool(u_xlatb2)) ? u_xlat4 : u_xlat0;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat7 = texture(_CameraDepthTexture, vs_TEXCOORD3.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(u_xlat6>=u_xlat7);
					#else
					    u_xlatb6 = u_xlat6>=u_xlat7;
					#endif
					    u_xlat7 = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat6 = (u_xlatb6) ? u_xlat16_3.w : u_xlat7;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.428571433<u_xlat6);
					#else
					    u_xlatb6 = 0.428571433<u_xlat6;
					#endif
					    u_xlat0 = (bool(u_xlatb6)) ? u_xlat4 : u_xlat0;
					    u_xlat7 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb11) ? u_xlat7 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb16) ? u_xlat11 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb2) ? u_xlat11 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb6) ? u_xlat11 : u_xlat1.x;
					    SV_Target0 = u_xlat0 / u_xlat1.xxxx;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					bool u_xlatb2;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					float u_xlat11;
					bool u_xlatb11;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat1.x = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat6 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat6>=u_xlat1.x);
					#else
					    u_xlatb1 = u_xlat6>=u_xlat1.x;
					#endif
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat11 = min(u_xlat16_0.w, u_xlat2.w);
					    u_xlat1.x = (u_xlatb1) ? u_xlat16_0.w : u_xlat11;
					    u_xlat0 = u_xlat16_0 + u_xlat2;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.142857149<u_xlat1.x);
					#else
					    u_xlatb1 = 0.142857149<u_xlat1.x;
					#endif
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
					    u_xlat1.xz = (bool(u_xlatb1)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat16 = texture(_CameraDepthTexture, vs_TEXCOORD1.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(u_xlat6>=u_xlat16);
					#else
					    u_xlatb16 = u_xlat6>=u_xlat16;
					#endif
					    u_xlat2.x = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat16 = (u_xlatb16) ? u_xlat16_3.w : u_xlat2.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(0.142857149<u_xlat16);
					#else
					    u_xlatb16 = 0.142857149<u_xlat16;
					#endif
					    u_xlat0 = (bool(u_xlatb16)) ? u_xlat4 : u_xlat0;
					    u_xlat1.x = (u_xlatb16) ? u_xlat1.z : u_xlat1.x;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat11 = texture(_CameraDepthTexture, vs_TEXCOORD2.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb11 = !!(u_xlat6>=u_xlat11);
					#else
					    u_xlatb11 = u_xlat6>=u_xlat11;
					#endif
					    u_xlat16 = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat11 = (u_xlatb11) ? u_xlat16_3.w : u_xlat16;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb11 = !!(0.285714298<u_xlat11);
					#else
					    u_xlatb11 = 0.285714298<u_xlat11;
					#endif
					    u_xlat0 = (bool(u_xlatb11)) ? u_xlat4 : u_xlat0;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat16 = texture(_CameraDepthTexture, vs_TEXCOORD2.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(u_xlat6>=u_xlat16);
					#else
					    u_xlatb16 = u_xlat6>=u_xlat16;
					#endif
					    u_xlat2.x = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat16 = (u_xlatb16) ? u_xlat16_3.w : u_xlat2.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(0.285714298<u_xlat16);
					#else
					    u_xlatb16 = 0.285714298<u_xlat16;
					#endif
					    u_xlat0 = (bool(u_xlatb16)) ? u_xlat4 : u_xlat0;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat2.x = texture(_CameraDepthTexture, vs_TEXCOORD3.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat6>=u_xlat2.x);
					#else
					    u_xlatb2 = u_xlat6>=u_xlat2.x;
					#endif
					    u_xlat7 = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat16_3.w : u_xlat7;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.428571433<u_xlat2.x);
					#else
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					#endif
					    u_xlat0 = (bool(u_xlatb2)) ? u_xlat4 : u_xlat0;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat7 = texture(_CameraDepthTexture, vs_TEXCOORD3.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(u_xlat6>=u_xlat7);
					#else
					    u_xlatb6 = u_xlat6>=u_xlat7;
					#endif
					    u_xlat7 = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat6 = (u_xlatb6) ? u_xlat16_3.w : u_xlat7;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.428571433<u_xlat6);
					#else
					    u_xlatb6 = 0.428571433<u_xlat6;
					#endif
					    u_xlat0 = (bool(u_xlatb6)) ? u_xlat4 : u_xlat0;
					    u_xlat7 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb11) ? u_xlat7 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb16) ? u_xlat11 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb2) ? u_xlat11 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb6) ? u_xlat11 : u_xlat1.x;
					    SV_Target0 = u_xlat0 / u_xlat1.xxxx;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					bool u_xlatb2;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					float u_xlat11;
					bool u_xlatb11;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat1.x = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat6 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat6>=u_xlat1.x);
					#else
					    u_xlatb1 = u_xlat6>=u_xlat1.x;
					#endif
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat11 = min(u_xlat16_0.w, u_xlat2.w);
					    u_xlat1.x = (u_xlatb1) ? u_xlat16_0.w : u_xlat11;
					    u_xlat0 = u_xlat16_0 + u_xlat2;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.142857149<u_xlat1.x);
					#else
					    u_xlatb1 = 0.142857149<u_xlat1.x;
					#endif
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
					    u_xlat1.xz = (bool(u_xlatb1)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat16 = texture(_CameraDepthTexture, vs_TEXCOORD1.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(u_xlat6>=u_xlat16);
					#else
					    u_xlatb16 = u_xlat6>=u_xlat16;
					#endif
					    u_xlat2.x = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat16 = (u_xlatb16) ? u_xlat16_3.w : u_xlat2.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(0.142857149<u_xlat16);
					#else
					    u_xlatb16 = 0.142857149<u_xlat16;
					#endif
					    u_xlat0 = (bool(u_xlatb16)) ? u_xlat4 : u_xlat0;
					    u_xlat1.x = (u_xlatb16) ? u_xlat1.z : u_xlat1.x;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat11 = texture(_CameraDepthTexture, vs_TEXCOORD2.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb11 = !!(u_xlat6>=u_xlat11);
					#else
					    u_xlatb11 = u_xlat6>=u_xlat11;
					#endif
					    u_xlat16 = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat11 = (u_xlatb11) ? u_xlat16_3.w : u_xlat16;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb11 = !!(0.285714298<u_xlat11);
					#else
					    u_xlatb11 = 0.285714298<u_xlat11;
					#endif
					    u_xlat0 = (bool(u_xlatb11)) ? u_xlat4 : u_xlat0;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat16 = texture(_CameraDepthTexture, vs_TEXCOORD2.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(u_xlat6>=u_xlat16);
					#else
					    u_xlatb16 = u_xlat6>=u_xlat16;
					#endif
					    u_xlat2.x = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat16 = (u_xlatb16) ? u_xlat16_3.w : u_xlat2.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(0.285714298<u_xlat16);
					#else
					    u_xlatb16 = 0.285714298<u_xlat16;
					#endif
					    u_xlat0 = (bool(u_xlatb16)) ? u_xlat4 : u_xlat0;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat2.x = texture(_CameraDepthTexture, vs_TEXCOORD3.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat6>=u_xlat2.x);
					#else
					    u_xlatb2 = u_xlat6>=u_xlat2.x;
					#endif
					    u_xlat7 = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat16_3.w : u_xlat7;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.428571433<u_xlat2.x);
					#else
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					#endif
					    u_xlat0 = (bool(u_xlatb2)) ? u_xlat4 : u_xlat0;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat4 = u_xlat0 + u_xlat16_3;
					    u_xlat7 = texture(_CameraDepthTexture, vs_TEXCOORD3.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(u_xlat6>=u_xlat7);
					#else
					    u_xlatb6 = u_xlat6>=u_xlat7;
					#endif
					    u_xlat7 = min(u_xlat2.w, u_xlat16_3.w);
					    u_xlat6 = (u_xlatb6) ? u_xlat16_3.w : u_xlat7;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.428571433<u_xlat6);
					#else
					    u_xlatb6 = 0.428571433<u_xlat6;
					#endif
					    u_xlat0 = (bool(u_xlatb6)) ? u_xlat4 : u_xlat0;
					    u_xlat7 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb11) ? u_xlat7 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb16) ? u_xlat11 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb2) ? u_xlat11 : u_xlat1.x;
					    u_xlat11 = u_xlat1.x + 1.0;
					    u_xlat1.x = (u_xlatb6) ? u_xlat11 : u_xlat1.x;
					    SV_Target0 = u_xlat0 / u_xlat1.xxxx;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD4;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD6 = u_xlat0 * vec4(6.0, 6.0, 6.0, 6.0) + in_TEXCOORD0.xyxy;
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
					uniform highp sampler2D _CameraDepthTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD4;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec3 u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat8;
					bool u_xlatb8;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat14;
					bool u_xlatb14;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2.x = texture2D(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat8 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlatb2 = u_xlat8>=u_xlat2.x;
					    u_xlat3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat14 = min(u_xlat10_1.w, u_xlat3.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat10_1.w : u_xlat14;
					    u_xlat1 = u_xlat10_1 + u_xlat3;
					    u_xlatb2 = 0.142857149<u_xlat2.x;
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat1 : u_xlat3;
					    u_xlat2.xz = (bool(u_xlatb2)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat4 = u_xlat10_0 + u_xlat1;
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD1.zw).x;
					    u_xlatb0 = u_xlat8>=u_xlat0;
					    u_xlat6 = min(u_xlat10_0.w, u_xlat3.w);
					    u_xlat0 = (u_xlatb0) ? u_xlat10_0.w : u_xlat6;
					    u_xlatb0 = 0.142857149<u_xlat0;
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat1;
					    u_xlat0 = (u_xlatb0) ? u_xlat2.z : u_xlat2.x;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat6 = texture2D(_CameraDepthTexture, vs_TEXCOORD2.xy).x;
					    u_xlatb6 = u_xlat8>=u_xlat6;
					    u_xlat12 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat6 = (u_xlatb6) ? u_xlat10_4.w : u_xlat12;
					    u_xlatb6 = 0.285714298<u_xlat6;
					    u_xlat1 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat12 = texture2D(_CameraDepthTexture, vs_TEXCOORD2.zw).x;
					    u_xlatb12 = u_xlat8>=u_xlat12;
					    u_xlat18 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat12 = (u_xlatb12) ? u_xlat10_4.w : u_xlat18;
					    u_xlatb12 = 0.285714298<u_xlat12;
					    u_xlat1 = (bool(u_xlatb12)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat18 = texture2D(_CameraDepthTexture, vs_TEXCOORD3.xy).x;
					    u_xlatb18 = u_xlat8>=u_xlat18;
					    u_xlat2.x = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat18 = (u_xlatb18) ? u_xlat10_4.w : u_xlat2.x;
					    u_xlatb18 = 0.428571433<u_xlat18;
					    u_xlat1 = (bool(u_xlatb18)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat2.x = texture2D(_CameraDepthTexture, vs_TEXCOORD3.zw).x;
					    u_xlatb2 = u_xlat8>=u_xlat2.x;
					    u_xlat14 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat10_4.w : u_xlat14;
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat14 = texture2D(_CameraDepthTexture, vs_TEXCOORD4.xy).x;
					    u_xlatb14 = u_xlat8>=u_xlat14;
					    u_xlat20 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat14 = (u_xlatb14) ? u_xlat10_4.w : u_xlat20;
					    u_xlatb14 = 0.571428597<u_xlat14;
					    u_xlat1 = (bool(u_xlatb14)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat20 = texture2D(_CameraDepthTexture, vs_TEXCOORD4.zw).x;
					    u_xlatb20 = u_xlat8>=u_xlat20;
					    u_xlat3.x = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat20 = (u_xlatb20) ? u_xlat10_4.w : u_xlat3.x;
					    u_xlatb20 = 0.571428597<u_xlat20;
					    u_xlat1 = (bool(u_xlatb20)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat3.x = texture2D(_CameraDepthTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb3 = u_xlat8>=u_xlat3.x;
					    u_xlat9 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat3.x = (u_xlatb3) ? u_xlat10_4.w : u_xlat9;
					    u_xlatb3 = 0.714285731<u_xlat3.x;
					    u_xlat1 = (bool(u_xlatb3)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat9 = texture2D(_CameraDepthTexture, vs_TEXCOORD5.zw).x;
					    u_xlatb9 = u_xlat8>=u_xlat9;
					    u_xlat15 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat9 = (u_xlatb9) ? u_xlat10_4.w : u_xlat15;
					    u_xlatb9 = 0.714285731<u_xlat9;
					    u_xlat1 = (bool(u_xlatb9)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat15 = texture2D(_CameraDepthTexture, vs_TEXCOORD6.xy).x;
					    u_xlatb15 = u_xlat8>=u_xlat15;
					    u_xlat4.x = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat15 = (u_xlatb15) ? u_xlat10_4.w : u_xlat4.x;
					    u_xlatb15 = 0.857142866<u_xlat15;
					    u_xlat1 = (bool(u_xlatb15)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD6.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat4.x = texture2D(_CameraDepthTexture, vs_TEXCOORD6.zw).x;
					    u_xlatb8 = u_xlat8>=u_xlat4.x;
					    u_xlat21 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat8 = (u_xlatb8) ? u_xlat10_4.w : u_xlat21;
					    u_xlatb8 = 0.857142866<u_xlat8;
					    u_xlat1 = (bool(u_xlatb8)) ? u_xlat5 : u_xlat1;
					    u_xlat21 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb6) ? u_xlat21 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb12) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb18) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb2) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb14) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb20) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb3) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb9) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb8) ? u_xlat6 : u_xlat0;
					    SV_Target0 = u_xlat1 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD4;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD6 = u_xlat0 * vec4(6.0, 6.0, 6.0, 6.0) + in_TEXCOORD0.xyxy;
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
					uniform highp sampler2D _CameraDepthTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD4;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec3 u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat8;
					bool u_xlatb8;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat14;
					bool u_xlatb14;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2.x = texture2D(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat8 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlatb2 = u_xlat8>=u_xlat2.x;
					    u_xlat3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat14 = min(u_xlat10_1.w, u_xlat3.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat10_1.w : u_xlat14;
					    u_xlat1 = u_xlat10_1 + u_xlat3;
					    u_xlatb2 = 0.142857149<u_xlat2.x;
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat1 : u_xlat3;
					    u_xlat2.xz = (bool(u_xlatb2)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat4 = u_xlat10_0 + u_xlat1;
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD1.zw).x;
					    u_xlatb0 = u_xlat8>=u_xlat0;
					    u_xlat6 = min(u_xlat10_0.w, u_xlat3.w);
					    u_xlat0 = (u_xlatb0) ? u_xlat10_0.w : u_xlat6;
					    u_xlatb0 = 0.142857149<u_xlat0;
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat1;
					    u_xlat0 = (u_xlatb0) ? u_xlat2.z : u_xlat2.x;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat6 = texture2D(_CameraDepthTexture, vs_TEXCOORD2.xy).x;
					    u_xlatb6 = u_xlat8>=u_xlat6;
					    u_xlat12 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat6 = (u_xlatb6) ? u_xlat10_4.w : u_xlat12;
					    u_xlatb6 = 0.285714298<u_xlat6;
					    u_xlat1 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat12 = texture2D(_CameraDepthTexture, vs_TEXCOORD2.zw).x;
					    u_xlatb12 = u_xlat8>=u_xlat12;
					    u_xlat18 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat12 = (u_xlatb12) ? u_xlat10_4.w : u_xlat18;
					    u_xlatb12 = 0.285714298<u_xlat12;
					    u_xlat1 = (bool(u_xlatb12)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat18 = texture2D(_CameraDepthTexture, vs_TEXCOORD3.xy).x;
					    u_xlatb18 = u_xlat8>=u_xlat18;
					    u_xlat2.x = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat18 = (u_xlatb18) ? u_xlat10_4.w : u_xlat2.x;
					    u_xlatb18 = 0.428571433<u_xlat18;
					    u_xlat1 = (bool(u_xlatb18)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat2.x = texture2D(_CameraDepthTexture, vs_TEXCOORD3.zw).x;
					    u_xlatb2 = u_xlat8>=u_xlat2.x;
					    u_xlat14 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat10_4.w : u_xlat14;
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat14 = texture2D(_CameraDepthTexture, vs_TEXCOORD4.xy).x;
					    u_xlatb14 = u_xlat8>=u_xlat14;
					    u_xlat20 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat14 = (u_xlatb14) ? u_xlat10_4.w : u_xlat20;
					    u_xlatb14 = 0.571428597<u_xlat14;
					    u_xlat1 = (bool(u_xlatb14)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat20 = texture2D(_CameraDepthTexture, vs_TEXCOORD4.zw).x;
					    u_xlatb20 = u_xlat8>=u_xlat20;
					    u_xlat3.x = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat20 = (u_xlatb20) ? u_xlat10_4.w : u_xlat3.x;
					    u_xlatb20 = 0.571428597<u_xlat20;
					    u_xlat1 = (bool(u_xlatb20)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat3.x = texture2D(_CameraDepthTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb3 = u_xlat8>=u_xlat3.x;
					    u_xlat9 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat3.x = (u_xlatb3) ? u_xlat10_4.w : u_xlat9;
					    u_xlatb3 = 0.714285731<u_xlat3.x;
					    u_xlat1 = (bool(u_xlatb3)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat9 = texture2D(_CameraDepthTexture, vs_TEXCOORD5.zw).x;
					    u_xlatb9 = u_xlat8>=u_xlat9;
					    u_xlat15 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat9 = (u_xlatb9) ? u_xlat10_4.w : u_xlat15;
					    u_xlatb9 = 0.714285731<u_xlat9;
					    u_xlat1 = (bool(u_xlatb9)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat15 = texture2D(_CameraDepthTexture, vs_TEXCOORD6.xy).x;
					    u_xlatb15 = u_xlat8>=u_xlat15;
					    u_xlat4.x = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat15 = (u_xlatb15) ? u_xlat10_4.w : u_xlat4.x;
					    u_xlatb15 = 0.857142866<u_xlat15;
					    u_xlat1 = (bool(u_xlatb15)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD6.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat4.x = texture2D(_CameraDepthTexture, vs_TEXCOORD6.zw).x;
					    u_xlatb8 = u_xlat8>=u_xlat4.x;
					    u_xlat21 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat8 = (u_xlatb8) ? u_xlat10_4.w : u_xlat21;
					    u_xlatb8 = 0.857142866<u_xlat8;
					    u_xlat1 = (bool(u_xlatb8)) ? u_xlat5 : u_xlat1;
					    u_xlat21 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb6) ? u_xlat21 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb12) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb18) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb2) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb14) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb20) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb3) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb9) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb8) ? u_xlat6 : u_xlat0;
					    SV_Target0 = u_xlat1 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD4;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD6 = u_xlat0 * vec4(6.0, 6.0, 6.0, 6.0) + in_TEXCOORD0.xyxy;
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
					uniform highp sampler2D _CameraDepthTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD4;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec3 u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat8;
					bool u_xlatb8;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat14;
					bool u_xlatb14;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2.x = texture2D(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat8 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlatb2 = u_xlat8>=u_xlat2.x;
					    u_xlat3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat14 = min(u_xlat10_1.w, u_xlat3.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat10_1.w : u_xlat14;
					    u_xlat1 = u_xlat10_1 + u_xlat3;
					    u_xlatb2 = 0.142857149<u_xlat2.x;
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat1 : u_xlat3;
					    u_xlat2.xz = (bool(u_xlatb2)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat4 = u_xlat10_0 + u_xlat1;
					    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD1.zw).x;
					    u_xlatb0 = u_xlat8>=u_xlat0;
					    u_xlat6 = min(u_xlat10_0.w, u_xlat3.w);
					    u_xlat0 = (u_xlatb0) ? u_xlat10_0.w : u_xlat6;
					    u_xlatb0 = 0.142857149<u_xlat0;
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat1;
					    u_xlat0 = (u_xlatb0) ? u_xlat2.z : u_xlat2.x;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat6 = texture2D(_CameraDepthTexture, vs_TEXCOORD2.xy).x;
					    u_xlatb6 = u_xlat8>=u_xlat6;
					    u_xlat12 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat6 = (u_xlatb6) ? u_xlat10_4.w : u_xlat12;
					    u_xlatb6 = 0.285714298<u_xlat6;
					    u_xlat1 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat12 = texture2D(_CameraDepthTexture, vs_TEXCOORD2.zw).x;
					    u_xlatb12 = u_xlat8>=u_xlat12;
					    u_xlat18 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat12 = (u_xlatb12) ? u_xlat10_4.w : u_xlat18;
					    u_xlatb12 = 0.285714298<u_xlat12;
					    u_xlat1 = (bool(u_xlatb12)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat18 = texture2D(_CameraDepthTexture, vs_TEXCOORD3.xy).x;
					    u_xlatb18 = u_xlat8>=u_xlat18;
					    u_xlat2.x = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat18 = (u_xlatb18) ? u_xlat10_4.w : u_xlat2.x;
					    u_xlatb18 = 0.428571433<u_xlat18;
					    u_xlat1 = (bool(u_xlatb18)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat2.x = texture2D(_CameraDepthTexture, vs_TEXCOORD3.zw).x;
					    u_xlatb2 = u_xlat8>=u_xlat2.x;
					    u_xlat14 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat10_4.w : u_xlat14;
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat14 = texture2D(_CameraDepthTexture, vs_TEXCOORD4.xy).x;
					    u_xlatb14 = u_xlat8>=u_xlat14;
					    u_xlat20 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat14 = (u_xlatb14) ? u_xlat10_4.w : u_xlat20;
					    u_xlatb14 = 0.571428597<u_xlat14;
					    u_xlat1 = (bool(u_xlatb14)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat20 = texture2D(_CameraDepthTexture, vs_TEXCOORD4.zw).x;
					    u_xlatb20 = u_xlat8>=u_xlat20;
					    u_xlat3.x = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat20 = (u_xlatb20) ? u_xlat10_4.w : u_xlat3.x;
					    u_xlatb20 = 0.571428597<u_xlat20;
					    u_xlat1 = (bool(u_xlatb20)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat3.x = texture2D(_CameraDepthTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb3 = u_xlat8>=u_xlat3.x;
					    u_xlat9 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat3.x = (u_xlatb3) ? u_xlat10_4.w : u_xlat9;
					    u_xlatb3 = 0.714285731<u_xlat3.x;
					    u_xlat1 = (bool(u_xlatb3)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat9 = texture2D(_CameraDepthTexture, vs_TEXCOORD5.zw).x;
					    u_xlatb9 = u_xlat8>=u_xlat9;
					    u_xlat15 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat9 = (u_xlatb9) ? u_xlat10_4.w : u_xlat15;
					    u_xlatb9 = 0.714285731<u_xlat9;
					    u_xlat1 = (bool(u_xlatb9)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat15 = texture2D(_CameraDepthTexture, vs_TEXCOORD6.xy).x;
					    u_xlatb15 = u_xlat8>=u_xlat15;
					    u_xlat4.x = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat15 = (u_xlatb15) ? u_xlat10_4.w : u_xlat4.x;
					    u_xlatb15 = 0.857142866<u_xlat15;
					    u_xlat1 = (bool(u_xlatb15)) ? u_xlat5 : u_xlat1;
					    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD6.zw);
					    u_xlat5 = u_xlat1 + u_xlat10_4;
					    u_xlat4.x = texture2D(_CameraDepthTexture, vs_TEXCOORD6.zw).x;
					    u_xlatb8 = u_xlat8>=u_xlat4.x;
					    u_xlat21 = min(u_xlat3.w, u_xlat10_4.w);
					    u_xlat8 = (u_xlatb8) ? u_xlat10_4.w : u_xlat21;
					    u_xlatb8 = 0.857142866<u_xlat8;
					    u_xlat1 = (bool(u_xlatb8)) ? u_xlat5 : u_xlat1;
					    u_xlat21 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb6) ? u_xlat21 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb12) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb18) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb2) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb14) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb20) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb3) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb9) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb8) ? u_xlat6 : u_xlat0;
					    SV_Target0 = u_xlat1 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD6 = u_xlat0 * vec4(6.0, 6.0, 6.0, 6.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					in highp vec4 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					in highp vec4 vs_TEXCOORD6;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					mediump vec4 u_xlat16_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec3 u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					mediump vec4 u_xlat16_4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat8;
					bool u_xlatb8;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat14;
					bool u_xlatb14;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2.x = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat8 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat8>=u_xlat2.x);
					#else
					    u_xlatb2 = u_xlat8>=u_xlat2.x;
					#endif
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat14 = min(u_xlat16_1.w, u_xlat3.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat16_1.w : u_xlat14;
					    u_xlat1 = u_xlat16_1 + u_xlat3;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.142857149<u_xlat2.x);
					#else
					    u_xlatb2 = 0.142857149<u_xlat2.x;
					#endif
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat1 : u_xlat3;
					    u_xlat2.xz = (bool(u_xlatb2)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat4 = u_xlat16_0 + u_xlat1;
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD1.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat8>=u_xlat0);
					#else
					    u_xlatb0 = u_xlat8>=u_xlat0;
					#endif
					    u_xlat6 = min(u_xlat16_0.w, u_xlat3.w);
					    u_xlat0 = (u_xlatb0) ? u_xlat16_0.w : u_xlat6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.142857149<u_xlat0);
					#else
					    u_xlatb0 = 0.142857149<u_xlat0;
					#endif
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat1;
					    u_xlat0 = (u_xlatb0) ? u_xlat2.z : u_xlat2.x;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat6 = texture(_CameraDepthTexture, vs_TEXCOORD2.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(u_xlat8>=u_xlat6);
					#else
					    u_xlatb6 = u_xlat8>=u_xlat6;
					#endif
					    u_xlat12 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat6 = (u_xlatb6) ? u_xlat16_4.w : u_xlat12;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.285714298<u_xlat6);
					#else
					    u_xlatb6 = 0.285714298<u_xlat6;
					#endif
					    u_xlat1 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat12 = texture(_CameraDepthTexture, vs_TEXCOORD2.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat8>=u_xlat12);
					#else
					    u_xlatb12 = u_xlat8>=u_xlat12;
					#endif
					    u_xlat18 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat12 = (u_xlatb12) ? u_xlat16_4.w : u_xlat18;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(0.285714298<u_xlat12);
					#else
					    u_xlatb12 = 0.285714298<u_xlat12;
					#endif
					    u_xlat1 = (bool(u_xlatb12)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat18 = texture(_CameraDepthTexture, vs_TEXCOORD3.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat8>=u_xlat18);
					#else
					    u_xlatb18 = u_xlat8>=u_xlat18;
					#endif
					    u_xlat2.x = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat18 = (u_xlatb18) ? u_xlat16_4.w : u_xlat2.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(0.428571433<u_xlat18);
					#else
					    u_xlatb18 = 0.428571433<u_xlat18;
					#endif
					    u_xlat1 = (bool(u_xlatb18)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat2.x = texture(_CameraDepthTexture, vs_TEXCOORD3.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat8>=u_xlat2.x);
					#else
					    u_xlatb2 = u_xlat8>=u_xlat2.x;
					#endif
					    u_xlat14 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat16_4.w : u_xlat14;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.428571433<u_xlat2.x);
					#else
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					#endif
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat14 = texture(_CameraDepthTexture, vs_TEXCOORD4.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(u_xlat8>=u_xlat14);
					#else
					    u_xlatb14 = u_xlat8>=u_xlat14;
					#endif
					    u_xlat20 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat14 = (u_xlatb14) ? u_xlat16_4.w : u_xlat20;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(0.571428597<u_xlat14);
					#else
					    u_xlatb14 = 0.571428597<u_xlat14;
					#endif
					    u_xlat1 = (bool(u_xlatb14)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat20 = texture(_CameraDepthTexture, vs_TEXCOORD4.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb20 = !!(u_xlat8>=u_xlat20);
					#else
					    u_xlatb20 = u_xlat8>=u_xlat20;
					#endif
					    u_xlat3.x = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat20 = (u_xlatb20) ? u_xlat16_4.w : u_xlat3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb20 = !!(0.571428597<u_xlat20);
					#else
					    u_xlatb20 = 0.571428597<u_xlat20;
					#endif
					    u_xlat1 = (bool(u_xlatb20)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat3.x = texture(_CameraDepthTexture, vs_TEXCOORD5.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat8>=u_xlat3.x);
					#else
					    u_xlatb3 = u_xlat8>=u_xlat3.x;
					#endif
					    u_xlat9 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat3.x = (u_xlatb3) ? u_xlat16_4.w : u_xlat9;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.714285731<u_xlat3.x);
					#else
					    u_xlatb3 = 0.714285731<u_xlat3.x;
					#endif
					    u_xlat1 = (bool(u_xlatb3)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat9 = texture(_CameraDepthTexture, vs_TEXCOORD5.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat8>=u_xlat9);
					#else
					    u_xlatb9 = u_xlat8>=u_xlat9;
					#endif
					    u_xlat15 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat9 = (u_xlatb9) ? u_xlat16_4.w : u_xlat15;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(0.714285731<u_xlat9);
					#else
					    u_xlatb9 = 0.714285731<u_xlat9;
					#endif
					    u_xlat1 = (bool(u_xlatb9)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat15 = texture(_CameraDepthTexture, vs_TEXCOORD6.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(u_xlat8>=u_xlat15);
					#else
					    u_xlatb15 = u_xlat8>=u_xlat15;
					#endif
					    u_xlat4.x = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat15 = (u_xlatb15) ? u_xlat16_4.w : u_xlat4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(0.857142866<u_xlat15);
					#else
					    u_xlatb15 = 0.857142866<u_xlat15;
					#endif
					    u_xlat1 = (bool(u_xlatb15)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD6.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat4.x = texture(_CameraDepthTexture, vs_TEXCOORD6.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlat8>=u_xlat4.x);
					#else
					    u_xlatb8 = u_xlat8>=u_xlat4.x;
					#endif
					    u_xlat21 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat8 = (u_xlatb8) ? u_xlat16_4.w : u_xlat21;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(0.857142866<u_xlat8);
					#else
					    u_xlatb8 = 0.857142866<u_xlat8;
					#endif
					    u_xlat1 = (bool(u_xlatb8)) ? u_xlat5 : u_xlat1;
					    u_xlat21 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb6) ? u_xlat21 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb12) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb18) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb2) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb14) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb20) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb3) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb9) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb8) ? u_xlat6 : u_xlat0;
					    SV_Target0 = u_xlat1 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD6 = u_xlat0 * vec4(6.0, 6.0, 6.0, 6.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					in highp vec4 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					in highp vec4 vs_TEXCOORD6;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					mediump vec4 u_xlat16_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec3 u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					mediump vec4 u_xlat16_4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat8;
					bool u_xlatb8;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat14;
					bool u_xlatb14;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2.x = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat8 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat8>=u_xlat2.x);
					#else
					    u_xlatb2 = u_xlat8>=u_xlat2.x;
					#endif
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat14 = min(u_xlat16_1.w, u_xlat3.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat16_1.w : u_xlat14;
					    u_xlat1 = u_xlat16_1 + u_xlat3;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.142857149<u_xlat2.x);
					#else
					    u_xlatb2 = 0.142857149<u_xlat2.x;
					#endif
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat1 : u_xlat3;
					    u_xlat2.xz = (bool(u_xlatb2)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat4 = u_xlat16_0 + u_xlat1;
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD1.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat8>=u_xlat0);
					#else
					    u_xlatb0 = u_xlat8>=u_xlat0;
					#endif
					    u_xlat6 = min(u_xlat16_0.w, u_xlat3.w);
					    u_xlat0 = (u_xlatb0) ? u_xlat16_0.w : u_xlat6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.142857149<u_xlat0);
					#else
					    u_xlatb0 = 0.142857149<u_xlat0;
					#endif
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat1;
					    u_xlat0 = (u_xlatb0) ? u_xlat2.z : u_xlat2.x;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat6 = texture(_CameraDepthTexture, vs_TEXCOORD2.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(u_xlat8>=u_xlat6);
					#else
					    u_xlatb6 = u_xlat8>=u_xlat6;
					#endif
					    u_xlat12 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat6 = (u_xlatb6) ? u_xlat16_4.w : u_xlat12;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.285714298<u_xlat6);
					#else
					    u_xlatb6 = 0.285714298<u_xlat6;
					#endif
					    u_xlat1 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat12 = texture(_CameraDepthTexture, vs_TEXCOORD2.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat8>=u_xlat12);
					#else
					    u_xlatb12 = u_xlat8>=u_xlat12;
					#endif
					    u_xlat18 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat12 = (u_xlatb12) ? u_xlat16_4.w : u_xlat18;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(0.285714298<u_xlat12);
					#else
					    u_xlatb12 = 0.285714298<u_xlat12;
					#endif
					    u_xlat1 = (bool(u_xlatb12)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat18 = texture(_CameraDepthTexture, vs_TEXCOORD3.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat8>=u_xlat18);
					#else
					    u_xlatb18 = u_xlat8>=u_xlat18;
					#endif
					    u_xlat2.x = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat18 = (u_xlatb18) ? u_xlat16_4.w : u_xlat2.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(0.428571433<u_xlat18);
					#else
					    u_xlatb18 = 0.428571433<u_xlat18;
					#endif
					    u_xlat1 = (bool(u_xlatb18)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat2.x = texture(_CameraDepthTexture, vs_TEXCOORD3.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat8>=u_xlat2.x);
					#else
					    u_xlatb2 = u_xlat8>=u_xlat2.x;
					#endif
					    u_xlat14 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat16_4.w : u_xlat14;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.428571433<u_xlat2.x);
					#else
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					#endif
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat14 = texture(_CameraDepthTexture, vs_TEXCOORD4.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(u_xlat8>=u_xlat14);
					#else
					    u_xlatb14 = u_xlat8>=u_xlat14;
					#endif
					    u_xlat20 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat14 = (u_xlatb14) ? u_xlat16_4.w : u_xlat20;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(0.571428597<u_xlat14);
					#else
					    u_xlatb14 = 0.571428597<u_xlat14;
					#endif
					    u_xlat1 = (bool(u_xlatb14)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat20 = texture(_CameraDepthTexture, vs_TEXCOORD4.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb20 = !!(u_xlat8>=u_xlat20);
					#else
					    u_xlatb20 = u_xlat8>=u_xlat20;
					#endif
					    u_xlat3.x = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat20 = (u_xlatb20) ? u_xlat16_4.w : u_xlat3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb20 = !!(0.571428597<u_xlat20);
					#else
					    u_xlatb20 = 0.571428597<u_xlat20;
					#endif
					    u_xlat1 = (bool(u_xlatb20)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat3.x = texture(_CameraDepthTexture, vs_TEXCOORD5.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat8>=u_xlat3.x);
					#else
					    u_xlatb3 = u_xlat8>=u_xlat3.x;
					#endif
					    u_xlat9 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat3.x = (u_xlatb3) ? u_xlat16_4.w : u_xlat9;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.714285731<u_xlat3.x);
					#else
					    u_xlatb3 = 0.714285731<u_xlat3.x;
					#endif
					    u_xlat1 = (bool(u_xlatb3)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat9 = texture(_CameraDepthTexture, vs_TEXCOORD5.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat8>=u_xlat9);
					#else
					    u_xlatb9 = u_xlat8>=u_xlat9;
					#endif
					    u_xlat15 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat9 = (u_xlatb9) ? u_xlat16_4.w : u_xlat15;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(0.714285731<u_xlat9);
					#else
					    u_xlatb9 = 0.714285731<u_xlat9;
					#endif
					    u_xlat1 = (bool(u_xlatb9)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat15 = texture(_CameraDepthTexture, vs_TEXCOORD6.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(u_xlat8>=u_xlat15);
					#else
					    u_xlatb15 = u_xlat8>=u_xlat15;
					#endif
					    u_xlat4.x = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat15 = (u_xlatb15) ? u_xlat16_4.w : u_xlat4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(0.857142866<u_xlat15);
					#else
					    u_xlatb15 = 0.857142866<u_xlat15;
					#endif
					    u_xlat1 = (bool(u_xlatb15)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD6.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat4.x = texture(_CameraDepthTexture, vs_TEXCOORD6.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlat8>=u_xlat4.x);
					#else
					    u_xlatb8 = u_xlat8>=u_xlat4.x;
					#endif
					    u_xlat21 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat8 = (u_xlatb8) ? u_xlat16_4.w : u_xlat21;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(0.857142866<u_xlat8);
					#else
					    u_xlatb8 = 0.857142866<u_xlat8;
					#endif
					    u_xlat1 = (bool(u_xlatb8)) ? u_xlat5 : u_xlat1;
					    u_xlat21 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb6) ? u_xlat21 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb12) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb18) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb2) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb14) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb20) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb3) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb9) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb8) ? u_xlat6 : u_xlat0;
					    SV_Target0 = u_xlat1 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _BlurDisp;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _MainTex_TexelSize.xyxy * _BlurDisp + in_TEXCOORD0.xyxy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * _BlurDisp;
					    vs_TEXCOORD2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0 * vec4(3.0, 3.0, 3.0, 3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD6 = u_xlat0 * vec4(6.0, 6.0, 6.0, 6.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					in highp vec4 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					in highp vec4 vs_TEXCOORD6;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					mediump vec4 u_xlat16_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec3 u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					mediump vec4 u_xlat16_4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat8;
					bool u_xlatb8;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat14;
					bool u_xlatb14;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2.x = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat8 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat8>=u_xlat2.x);
					#else
					    u_xlatb2 = u_xlat8>=u_xlat2.x;
					#endif
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat14 = min(u_xlat16_1.w, u_xlat3.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat16_1.w : u_xlat14;
					    u_xlat1 = u_xlat16_1 + u_xlat3;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.142857149<u_xlat2.x);
					#else
					    u_xlatb2 = 0.142857149<u_xlat2.x;
					#endif
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat1 : u_xlat3;
					    u_xlat2.xz = (bool(u_xlatb2)) ? vec2(2.0, 3.0) : vec2(1.0, 2.0);
					    u_xlat4 = u_xlat16_0 + u_xlat1;
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD1.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat8>=u_xlat0);
					#else
					    u_xlatb0 = u_xlat8>=u_xlat0;
					#endif
					    u_xlat6 = min(u_xlat16_0.w, u_xlat3.w);
					    u_xlat0 = (u_xlatb0) ? u_xlat16_0.w : u_xlat6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.142857149<u_xlat0);
					#else
					    u_xlatb0 = 0.142857149<u_xlat0;
					#endif
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat1;
					    u_xlat0 = (u_xlatb0) ? u_xlat2.z : u_xlat2.x;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat6 = texture(_CameraDepthTexture, vs_TEXCOORD2.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(u_xlat8>=u_xlat6);
					#else
					    u_xlatb6 = u_xlat8>=u_xlat6;
					#endif
					    u_xlat12 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat6 = (u_xlatb6) ? u_xlat16_4.w : u_xlat12;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.285714298<u_xlat6);
					#else
					    u_xlatb6 = 0.285714298<u_xlat6;
					#endif
					    u_xlat1 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat12 = texture(_CameraDepthTexture, vs_TEXCOORD2.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat8>=u_xlat12);
					#else
					    u_xlatb12 = u_xlat8>=u_xlat12;
					#endif
					    u_xlat18 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat12 = (u_xlatb12) ? u_xlat16_4.w : u_xlat18;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(0.285714298<u_xlat12);
					#else
					    u_xlatb12 = 0.285714298<u_xlat12;
					#endif
					    u_xlat1 = (bool(u_xlatb12)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat18 = texture(_CameraDepthTexture, vs_TEXCOORD3.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat8>=u_xlat18);
					#else
					    u_xlatb18 = u_xlat8>=u_xlat18;
					#endif
					    u_xlat2.x = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat18 = (u_xlatb18) ? u_xlat16_4.w : u_xlat2.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(0.428571433<u_xlat18);
					#else
					    u_xlatb18 = 0.428571433<u_xlat18;
					#endif
					    u_xlat1 = (bool(u_xlatb18)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat2.x = texture(_CameraDepthTexture, vs_TEXCOORD3.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat8>=u_xlat2.x);
					#else
					    u_xlatb2 = u_xlat8>=u_xlat2.x;
					#endif
					    u_xlat14 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat2.x = (u_xlatb2) ? u_xlat16_4.w : u_xlat14;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.428571433<u_xlat2.x);
					#else
					    u_xlatb2 = 0.428571433<u_xlat2.x;
					#endif
					    u_xlat1 = (bool(u_xlatb2)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat14 = texture(_CameraDepthTexture, vs_TEXCOORD4.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(u_xlat8>=u_xlat14);
					#else
					    u_xlatb14 = u_xlat8>=u_xlat14;
					#endif
					    u_xlat20 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat14 = (u_xlatb14) ? u_xlat16_4.w : u_xlat20;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(0.571428597<u_xlat14);
					#else
					    u_xlatb14 = 0.571428597<u_xlat14;
					#endif
					    u_xlat1 = (bool(u_xlatb14)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat20 = texture(_CameraDepthTexture, vs_TEXCOORD4.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb20 = !!(u_xlat8>=u_xlat20);
					#else
					    u_xlatb20 = u_xlat8>=u_xlat20;
					#endif
					    u_xlat3.x = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat20 = (u_xlatb20) ? u_xlat16_4.w : u_xlat3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb20 = !!(0.571428597<u_xlat20);
					#else
					    u_xlatb20 = 0.571428597<u_xlat20;
					#endif
					    u_xlat1 = (bool(u_xlatb20)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat3.x = texture(_CameraDepthTexture, vs_TEXCOORD5.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat8>=u_xlat3.x);
					#else
					    u_xlatb3 = u_xlat8>=u_xlat3.x;
					#endif
					    u_xlat9 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat3.x = (u_xlatb3) ? u_xlat16_4.w : u_xlat9;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.714285731<u_xlat3.x);
					#else
					    u_xlatb3 = 0.714285731<u_xlat3.x;
					#endif
					    u_xlat1 = (bool(u_xlatb3)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat9 = texture(_CameraDepthTexture, vs_TEXCOORD5.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat8>=u_xlat9);
					#else
					    u_xlatb9 = u_xlat8>=u_xlat9;
					#endif
					    u_xlat15 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat9 = (u_xlatb9) ? u_xlat16_4.w : u_xlat15;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(0.714285731<u_xlat9);
					#else
					    u_xlatb9 = 0.714285731<u_xlat9;
					#endif
					    u_xlat1 = (bool(u_xlatb9)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat15 = texture(_CameraDepthTexture, vs_TEXCOORD6.xy).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(u_xlat8>=u_xlat15);
					#else
					    u_xlatb15 = u_xlat8>=u_xlat15;
					#endif
					    u_xlat4.x = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat15 = (u_xlatb15) ? u_xlat16_4.w : u_xlat4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(0.857142866<u_xlat15);
					#else
					    u_xlatb15 = 0.857142866<u_xlat15;
					#endif
					    u_xlat1 = (bool(u_xlatb15)) ? u_xlat5 : u_xlat1;
					    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD6.zw);
					    u_xlat5 = u_xlat1 + u_xlat16_4;
					    u_xlat4.x = texture(_CameraDepthTexture, vs_TEXCOORD6.zw).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlat8>=u_xlat4.x);
					#else
					    u_xlatb8 = u_xlat8>=u_xlat4.x;
					#endif
					    u_xlat21 = min(u_xlat3.w, u_xlat16_4.w);
					    u_xlat8 = (u_xlatb8) ? u_xlat16_4.w : u_xlat21;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(0.857142866<u_xlat8);
					#else
					    u_xlatb8 = 0.857142866<u_xlat8;
					#endif
					    u_xlat1 = (bool(u_xlatb8)) ? u_xlat5 : u_xlat1;
					    u_xlat21 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb6) ? u_xlat21 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb12) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb18) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb2) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb14) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb20) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb3) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb9) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb15) ? u_xlat6 : u_xlat0;
					    u_xlat6 = u_xlat0 + 1.0;
					    u_xlat0 = (u_xlatb8) ? u_xlat6 : u_xlat0;
					    SV_Target0 = u_xlat1 / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 225932
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform lowp sampler2D _BlurTex1;
					uniform lowp sampler2D _BlurTex2;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat10_0, u_xlat10_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform lowp sampler2D _BlurTex1;
					uniform lowp sampler2D _BlurTex2;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat10_0, u_xlat10_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform lowp sampler2D _BlurTex1;
					uniform lowp sampler2D _BlurTex2;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat10_0, u_xlat10_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _BlurTex1;
					uniform mediump sampler2D _BlurTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _BlurTex1;
					uniform mediump sampler2D _BlurTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _BlurTex1;
					uniform mediump sampler2D _BlurTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform lowp sampler2D _BlurTex1;
					uniform lowp sampler2D _BlurTex2;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat10_0, u_xlat10_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform lowp sampler2D _BlurTex1;
					uniform lowp sampler2D _BlurTex2;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat10_0, u_xlat10_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform lowp sampler2D _BlurTex1;
					uniform lowp sampler2D _BlurTex2;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat10_0, u_xlat10_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _BlurTex1;
					uniform mediump sampler2D _BlurTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _BlurTex1;
					uniform mediump sampler2D _BlurTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _BlurTex1;
					uniform mediump sampler2D _BlurTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform lowp sampler2D _BlurTex1;
					uniform lowp sampler2D _BlurTex2;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat10_0, u_xlat10_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform lowp sampler2D _BlurTex1;
					uniform lowp sampler2D _BlurTex2;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat10_0, u_xlat10_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform lowp sampler2D _BlurTex1;
					uniform lowp sampler2D _BlurTex2;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat10_0, u_xlat10_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _BlurTex1;
					uniform mediump sampler2D _BlurTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _BlurTex1;
					uniform mediump sampler2D _BlurTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _BlurTex1;
					uniform mediump sampler2D _BlurTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform lowp sampler2D _BlurTex1;
					uniform lowp sampler2D _BlurTex2;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat10_0, u_xlat10_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform lowp sampler2D _BlurTex1;
					uniform lowp sampler2D _BlurTex2;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat10_0, u_xlat10_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform lowp sampler2D _BlurTex1;
					uniform lowp sampler2D _BlurTex2;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat10_0, u_xlat10_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _BlurTex1;
					uniform mediump sampler2D _BlurTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _BlurTex1;
					uniform mediump sampler2D _BlurTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _BlurTex1;
					uniform mediump sampler2D _BlurTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_BlurTex1, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_BlurTex2, vs_TEXCOORD0.xy);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_OFF" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_LOW" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "NEAR_ON" "SAMPLE_HIGH" }
					"!!GLES3"
				}
			}
		}
	}
}