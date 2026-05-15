extends RichTextLabel

var index = 0
var char_cooldown = 2
var current_dialog = dialog

var dialog_active = false
var dialogindex = 1
@onready var animation_player: AnimationPlayer = $"../VideoStreamPlayer/AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_dialog = dialog


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dialog_active:
		char_cooldown -= 1
		if char_cooldown <= 0:
			char_cooldown = 2
			visible_characters += 1

func next():
	dialog_active = true
	if visible_characters >= text.length():
		index += 1
		if index < current_dialog.size():
			text = "[center]" + current_dialog[index]
			visible_characters = 0
		else:
			index = 0
			dialogended()


func dialogended():
	visible_characters = 0
	dialog_active = false
	if dialogindex == 1:
		dialogindex = 2
		current_dialog = dialog2
	elif dialogindex == 2:
		animation_player.play("moveinandplay")
		dialogindex = 3
		current_dialog = dialog3
	elif dialogindex == 3:
		$"../AnimationPlayer2".play("fadeblack")
	
	text = "[center]" + current_dialog[index]

var dialog = [
	"Hallo!",
	"Wir haben uns heute hier zusammengefunden um den Tag eines ganz besonderen kleinen Rakcers zu feiern!",
	"Ja genau Mohsi! Denn heute wirst du...",
	"27 ganze Jahre Alt!",
	"Alle gute zum Geburstag!!",
	"und zu feier des Tages habe ich",
	"27! (siebenundzwanzig) dinge zusammengekratzt und dir mitzuteilen wie dankbar ich bin dich zu haben",
	"Das kann ein bisschen dauern...",
	"Also mach dich bereit und drücke auf das Herz wenn du ready bist (;"
]

var dialog2 = [
	"Dann wollen wir mal!",
	"#1 - Danke! Dass mit deiner Arbeitslosigkeit immer viel zeit zum Gammeln hast",
	"#2 - Danke! Dass du mir damals Perris Chicken gezeigt hast war echt mega lo",
	"#3 - Danke! Dass du Paki bist weil das ist iwie echt lustig",
	"#4 - Danke! Dass du immer fitna mit Frau Lehouka hattest weil das war auch immer echt lustig",
	"#5 - Weißt du noch als du die Reifen vom Hurensohn mit Messer durchgestochen hast?",
	"Ist mir grad wieder random eingefallen haha",
	"#6 - Danke! Dass du mir beim Umzug geholfen hast lo ehrlich ehrenmann",
	"#7 - Danke! Für das eine mal wo du mich und Lukas durch ganz Bremen gefahren hast und wir wollten nur diesen J rauchen aber haben den einfach nicht anbekommen bis zum schluss wie die größten leleks (Killer Memory)",
	"#8 - Danke! Wo du diese eine Sache gemacht hast weißt du noch das war krass...",
	"Ok ich bin ehrlich mir fällt langsam nichts mehr ein lo",
	"Ich will dich jtz auch gar nicht zu lange aufhalten ich bin sicher du hast heute noch viel vor",
	"Aber bevor du gehst!",
	"Eine kleine Überraschung habe ich noch für dich!",
	"(Geräusch von wie es an der Tür Klingelt) Oh?! Das ist sie auch schon!",
	"Komm doch rein!"
]

var dialog3 = [
	"Wow war das etwa Twitch Streamer Jerma985?",
	"Wie cool!",
	"Ok das wars, bye!"
]
