uniform float time;
uniform vec3 color;
uniform sampler2D pallete;
varying float vDisplace;

uniform vec3 fogColor;
uniform float fogNear;
uniform float fogFar;
varying float fogDepth;

uniform float scrollPercent;

void main() {

    vec2 stripPos = vec2( 0.0, vDisplace );
    vec4 stripColor = texture2D( pallete, stripPos );
    
    
    // scale the top strip colors by the current displacement
    stripColor *= pow(1.0-((1.0 - pow(scrollPercent, 0.5)) * vDisplace), 1.0);

    gl_FragColor = stripColor;

#ifdef USE_FOG
    float fogFactor = smoothstep( fogNear, fogFar, fogDepth );
    gl_FragColor.rgb = mix( gl_FragColor.rgb, fogColor, fogFactor );
#endif
}
