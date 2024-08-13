shader_type spatial;

uniform sampler2D noise_tex;

void vertex() {
  VERTEX += NORMAL * texture(noise_tex, VERTEX.xz * 0.1 + vec2(TIME)/2.0).r * 0.1;
}

void fragment() {
	vec3 color;
	color.r = sin(TIME*5.0 + VERTEX.x)+1.0;
	color.g = sin(TIME*6.0 + VERTEX.x)+1.0;
	color.b = sin(TIME+7.0 + VERTEX.x)+1.0;
	ALBEDO = color;
	ROUGHNESS = 0.2;
	RIM = 1.0;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
