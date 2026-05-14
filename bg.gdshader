shader_type canvas_item; uniform sampler2D t: hint_screen_texture, filter_linear_mipmap;
uniform float blur_amount : hint_range(-2.0, 10.0);
void fragment(){COLOR = vec4(textureLod(t, SCREEN_UV, blur_amount).rgb, 1);}