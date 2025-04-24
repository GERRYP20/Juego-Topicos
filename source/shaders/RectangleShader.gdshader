shader_type canvas_item;

uniform float rect_width : hint_range(0.0, 1.0) = 1.0;
uniform float rect_height : hint_range(0.0, 1.0) = 1.0;


void fragment() {
	vec2 rect_size = vec2(rect_width, rect_height);
	vec2 center = vec2(0.5, 0.5);
	
	vec2 min_bounds = center - rect_size;
    vec2 max_bounds = center + rect_size;
	
	// Si el píxel está dentro del rectángulo, se hace transparente
	if (UV.x > min_bounds.x && UV.x < max_bounds.x &&
		UV.y > min_bounds.y && UV.y < max_bounds.y) {
		COLOR.a = 0.0;
	}
}