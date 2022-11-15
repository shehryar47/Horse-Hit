Shader "Hidden/SeparableWeightedBlurDof34" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
		_TapMedium ("TapMedium (RGB)", 2D) = "" {}
		_TapLow ("TapLow (RGB)", 2D) = "" {}
		_TapHigh ("TapHigh (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 22110
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 offsets;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					varying mediump vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec3 u_xlat16_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD1.zw).xwyz;
					    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat0.xzw;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
					    u_xlat0.x = u_xlat10_2.w;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.25, 1.25, 1.25);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat10_2.www + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.25, 1.25, 1.25) + u_xlat16_3.xyz;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
					    u_xlat0.z = u_xlat10_3.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(1.5, 1.5, 1.5) + u_xlat16_1.xyz;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
					    u_xlat0.w = u_xlat10_3.w;
					    u_xlat16_16 = dot(vec4(1.25, 1.25, 1.5, 1.5), u_xlat0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat10_2.w;
					    SV_Target0.w = u_xlat10_2.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(1.5, 1.5, 1.5) + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
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
					uniform 	mediump vec4 offsets;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					varying mediump vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec3 u_xlat16_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD1.zw).xwyz;
					    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat0.xzw;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
					    u_xlat0.x = u_xlat10_2.w;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.25, 1.25, 1.25);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat10_2.www + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.25, 1.25, 1.25) + u_xlat16_3.xyz;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
					    u_xlat0.z = u_xlat10_3.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(1.5, 1.5, 1.5) + u_xlat16_1.xyz;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
					    u_xlat0.w = u_xlat10_3.w;
					    u_xlat16_16 = dot(vec4(1.25, 1.25, 1.5, 1.5), u_xlat0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat10_2.w;
					    SV_Target0.w = u_xlat10_2.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(1.5, 1.5, 1.5) + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
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
					uniform 	mediump vec4 offsets;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					varying mediump vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec3 u_xlat16_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD1.zw).xwyz;
					    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat0.xzw;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
					    u_xlat0.x = u_xlat10_2.w;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.25, 1.25, 1.25);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat10_2.www + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.25, 1.25, 1.25) + u_xlat16_3.xyz;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
					    u_xlat0.z = u_xlat10_3.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(1.5, 1.5, 1.5) + u_xlat16_1.xyz;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
					    u_xlat0.w = u_xlat10_3.w;
					    u_xlat16_16 = dot(vec4(1.25, 1.25, 1.5, 1.5), u_xlat0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat10_2.w;
					    SV_Target0.w = u_xlat10_2.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(1.5, 1.5, 1.5) + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
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
					uniform 	mediump vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					in mediump vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.zw).xwyz;
					    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat0.xzw;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
					    u_xlat0.x = u_xlat16_2.w;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.25, 1.25, 1.25);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.25, 1.25, 1.25) + u_xlat16_3.xyz;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
					    u_xlat0.z = u_xlat16_3.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(1.5, 1.5, 1.5) + u_xlat16_1.xyz;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
					    u_xlat0.w = u_xlat16_3.w;
					    u_xlat16_16 = dot(vec4(1.25, 1.25, 1.5, 1.5), u_xlat0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat16_2.w;
					    SV_Target0.w = u_xlat16_2.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(1.5, 1.5, 1.5) + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
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
					uniform 	mediump vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					in mediump vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.zw).xwyz;
					    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat0.xzw;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
					    u_xlat0.x = u_xlat16_2.w;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.25, 1.25, 1.25);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.25, 1.25, 1.25) + u_xlat16_3.xyz;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
					    u_xlat0.z = u_xlat16_3.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(1.5, 1.5, 1.5) + u_xlat16_1.xyz;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
					    u_xlat0.w = u_xlat16_3.w;
					    u_xlat16_16 = dot(vec4(1.25, 1.25, 1.5, 1.5), u_xlat0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat16_2.w;
					    SV_Target0.w = u_xlat16_2.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(1.5, 1.5, 1.5) + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
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
					uniform 	mediump vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					in mediump vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.zw).xwyz;
					    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat0.xzw;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
					    u_xlat0.x = u_xlat16_2.w;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.25, 1.25, 1.25);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.25, 1.25, 1.25) + u_xlat16_3.xyz;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
					    u_xlat0.z = u_xlat16_3.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(1.5, 1.5, 1.5) + u_xlat16_1.xyz;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
					    u_xlat0.w = u_xlat16_3.w;
					    u_xlat16_16 = dot(vec4(1.25, 1.25, 1.5, 1.5), u_xlat0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat16_2.w;
					    SV_Target0.w = u_xlat16_2.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(1.5, 1.5, 1.5) + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
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
			GpuProgramID 85835
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 offsets;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					uniform lowp sampler2D _TapHigh;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
					    u_xlat10_1.x = texture2D(_TapHigh, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = max(u_xlat16_0.w, u_xlat10_1.x);
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_1;
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
					uniform 	mediump vec4 offsets;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					uniform lowp sampler2D _TapHigh;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
					    u_xlat10_1.x = texture2D(_TapHigh, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = max(u_xlat16_0.w, u_xlat10_1.x);
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_1;
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
					uniform 	mediump vec4 offsets;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					uniform lowp sampler2D _TapHigh;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
					    u_xlat10_1.x = texture2D(_TapHigh, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = max(u_xlat16_0.w, u_xlat10_1.x);
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_1;
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
					uniform 	mediump vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _TapHigh;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
					    u_xlat16_1.x = texture(_TapHigh, vs_TEXCOORD0.xy).w;
					    u_xlat16_1.x = max(u_xlat16_0.w, u_xlat16_1.x);
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_1.x;
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
					uniform 	mediump vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _TapHigh;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
					    u_xlat16_1.x = texture(_TapHigh, vs_TEXCOORD0.xy).w;
					    u_xlat16_1.x = max(u_xlat16_0.w, u_xlat16_1.x);
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_1.x;
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
					uniform 	mediump vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _TapHigh;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
					    u_xlat16_1.x = texture(_TapHigh, vs_TEXCOORD0.xy).w;
					    u_xlat16_1.x = max(u_xlat16_0.w, u_xlat16_1.x);
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_1.x;
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
			GpuProgramID 192844
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 offsets;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					uniform lowp sampler2D _TapHigh;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat10_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_0;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.285714298, 0.285714298, 0.285714298, 0.285714298);
					    u_xlat10_1.x = texture2D(_TapHigh, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = max(u_xlat16_0.w, u_xlat10_1.x);
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_1;
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
					uniform 	mediump vec4 offsets;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					uniform lowp sampler2D _TapHigh;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat10_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_0;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.285714298, 0.285714298, 0.285714298, 0.285714298);
					    u_xlat10_1.x = texture2D(_TapHigh, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = max(u_xlat16_0.w, u_xlat10_1.x);
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_1;
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
					uniform 	mediump vec4 offsets;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					uniform lowp sampler2D _TapHigh;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat10_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_0;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_0;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.285714298, 0.285714298, 0.285714298, 0.285714298);
					    u_xlat10_1.x = texture2D(_TapHigh, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = max(u_xlat16_0.w, u_xlat10_1.x);
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_1;
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
					uniform 	mediump vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _TapHigh;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat16_1 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat16_1 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat16_1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_0;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.285714298, 0.285714298, 0.285714298, 0.285714298);
					    u_xlat16_1.x = texture(_TapHigh, vs_TEXCOORD0.xy).w;
					    u_xlat16_1.x = max(u_xlat16_0.w, u_xlat16_1.x);
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_1.x;
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
					uniform 	mediump vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _TapHigh;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat16_1 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat16_1 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat16_1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_0;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.285714298, 0.285714298, 0.285714298, 0.285714298);
					    u_xlat16_1.x = texture(_TapHigh, vs_TEXCOORD0.xy).w;
					    u_xlat16_1.x = max(u_xlat16_0.w, u_xlat16_1.x);
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_1.x;
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
					uniform 	mediump vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _TapHigh;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat16_1 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat16_1 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_0;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat16_1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_0;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.285714298, 0.285714298, 0.285714298, 0.285714298);
					    u_xlat16_1.x = texture(_TapHigh, vs_TEXCOORD0.xy).w;
					    u_xlat16_1.x = max(u_xlat16_0.w, u_xlat16_1.x);
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_1.x;
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
			GpuProgramID 238685
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
					uniform lowp sampler2D _TapMedium;
					uniform lowp sampler2D _TapLow;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_4;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapMedium, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat10_0.w * u_xlat10_0.w;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
					    u_xlat10_2 = texture2D(_TapLow, vs_TEXCOORD0.xy);
					    u_xlat16_4.xyz = (-u_xlat10_0.xyz) + u_xlat10_2.xyz;
					    SV_Target0.w = u_xlat10_2.w;
					    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_4.xyz + u_xlat10_0.xyz;
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
					uniform lowp sampler2D _TapMedium;
					uniform lowp sampler2D _TapLow;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_4;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapMedium, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat10_0.w * u_xlat10_0.w;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
					    u_xlat10_2 = texture2D(_TapLow, vs_TEXCOORD0.xy);
					    u_xlat16_4.xyz = (-u_xlat10_0.xyz) + u_xlat10_2.xyz;
					    SV_Target0.w = u_xlat10_2.w;
					    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_4.xyz + u_xlat10_0.xyz;
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
					uniform lowp sampler2D _TapMedium;
					uniform lowp sampler2D _TapLow;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_4;
					void main()
					{
					    u_xlat10_0 = texture2D(_TapMedium, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat10_0.w * u_xlat10_0.w;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
					    u_xlat10_2 = texture2D(_TapLow, vs_TEXCOORD0.xy);
					    u_xlat16_4.xyz = (-u_xlat10_0.xyz) + u_xlat10_2.xyz;
					    SV_Target0.w = u_xlat10_2.w;
					    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_4.xyz + u_xlat10_0.xyz;
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
					uniform mediump sampler2D _TapMedium;
					uniform mediump sampler2D _TapLow;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump float u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_4;
					void main()
					{
					    u_xlat16_0 = texture(_TapMedium, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat16_0.w * u_xlat16_0.w;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
					    u_xlat16_2 = texture(_TapLow, vs_TEXCOORD0.xy);
					    u_xlat16_4.xyz = (-u_xlat16_0.xyz) + u_xlat16_2.xyz;
					    SV_Target0.w = u_xlat16_2.w;
					    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_4.xyz + u_xlat16_0.xyz;
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
					uniform mediump sampler2D _TapMedium;
					uniform mediump sampler2D _TapLow;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump float u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_4;
					void main()
					{
					    u_xlat16_0 = texture(_TapMedium, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat16_0.w * u_xlat16_0.w;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
					    u_xlat16_2 = texture(_TapLow, vs_TEXCOORD0.xy);
					    u_xlat16_4.xyz = (-u_xlat16_0.xyz) + u_xlat16_2.xyz;
					    SV_Target0.w = u_xlat16_2.w;
					    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_4.xyz + u_xlat16_0.xyz;
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
					uniform mediump sampler2D _TapMedium;
					uniform mediump sampler2D _TapLow;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump float u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_4;
					void main()
					{
					    u_xlat16_0 = texture(_TapMedium, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat16_0.w * u_xlat16_0.w;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
					    u_xlat16_2 = texture(_TapLow, vs_TEXCOORD0.xy);
					    u_xlat16_4.xyz = (-u_xlat16_0.xyz) + u_xlat16_2.xyz;
					    SV_Target0.w = u_xlat16_2.w;
					    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_4.xyz + u_xlat16_0.xyz;
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
			GpuProgramID 299436
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 offsets;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					varying mediump vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec3 u_xlat16_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD1.zw).xwyz;
					    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat0.xzw;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
					    u_xlat0.x = u_xlat10_2.w;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.75, 0.75, 0.75);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat10_2.www + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.75, 0.75, 0.75) + u_xlat16_3.xyz;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
					    u_xlat0.z = u_xlat10_3.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
					    u_xlat0.w = u_xlat10_3.w;
					    u_xlat16_16 = dot(vec4(0.75, 0.75, 0.5, 0.5), u_xlat0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat10_2.w;
					    SV_Target0.w = u_xlat10_2.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
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
					uniform 	mediump vec4 offsets;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					varying mediump vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec3 u_xlat16_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD1.zw).xwyz;
					    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat0.xzw;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
					    u_xlat0.x = u_xlat10_2.w;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.75, 0.75, 0.75);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat10_2.www + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.75, 0.75, 0.75) + u_xlat16_3.xyz;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
					    u_xlat0.z = u_xlat10_3.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
					    u_xlat0.w = u_xlat10_3.w;
					    u_xlat16_16 = dot(vec4(0.75, 0.75, 0.5, 0.5), u_xlat0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat10_2.w;
					    SV_Target0.w = u_xlat10_2.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
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
					uniform 	mediump vec4 offsets;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying mediump vec4 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					varying mediump vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec3 u_xlat16_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD1.zw).xwyz;
					    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat0.xzw;
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
					    u_xlat0.x = u_xlat10_2.w;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.75, 0.75, 0.75);
					    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat10_2.www + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.75, 0.75, 0.75) + u_xlat16_3.xyz;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
					    u_xlat0.z = u_xlat10_3.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
					    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
					    u_xlat0.w = u_xlat10_3.w;
					    u_xlat16_16 = dot(vec4(0.75, 0.75, 0.5, 0.5), u_xlat0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat10_2.w;
					    SV_Target0.w = u_xlat10_2.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
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
					uniform 	mediump vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					in mediump vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.zw).xwyz;
					    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat0.xzw;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
					    u_xlat0.x = u_xlat16_2.w;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.75, 0.75, 0.75);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.75, 0.75, 0.75) + u_xlat16_3.xyz;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
					    u_xlat0.z = u_xlat16_3.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
					    u_xlat0.w = u_xlat16_3.w;
					    u_xlat16_16 = dot(vec4(0.75, 0.75, 0.5, 0.5), u_xlat0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat16_2.w;
					    SV_Target0.w = u_xlat16_2.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
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
					uniform 	mediump vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					in mediump vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.zw).xwyz;
					    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat0.xzw;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
					    u_xlat0.x = u_xlat16_2.w;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.75, 0.75, 0.75);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.75, 0.75, 0.75) + u_xlat16_3.xyz;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
					    u_xlat0.z = u_xlat16_3.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
					    u_xlat0.w = u_xlat16_3.w;
					    u_xlat16_16 = dot(vec4(0.75, 0.75, 0.5, 0.5), u_xlat0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat16_2.w;
					    SV_Target0.w = u_xlat16_2.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
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
					uniform 	mediump vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					in mediump vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.zw).xwyz;
					    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat0.xzw;
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
					    u_xlat0.x = u_xlat16_2.w;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.75, 0.75, 0.75);
					    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.75, 0.75, 0.75) + u_xlat16_3.xyz;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
					    u_xlat0.z = u_xlat16_3.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
					    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
					    u_xlat0.w = u_xlat16_3.w;
					    u_xlat16_16 = dot(vec4(0.75, 0.75, 0.5, 0.5), u_xlat0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat16_2.w;
					    SV_Target0.w = u_xlat16_2.w;
					    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
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