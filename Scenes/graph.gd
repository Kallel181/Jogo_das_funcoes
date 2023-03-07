extends Node2D

@export var is_active:bool = false

@export var step:float = 100
@export var max_x:int = 15 
@export var max_y:int = 15

func _draw() -> void:
	draw_bg_graph()
	create_labels_axis()


#======================================== Call ========================================
func add_point(pos:Vector2) -> void:
	var dot:Sprite2D = Sprite2D.new()
	var texture = load("res://Assets/Circle.png")
	dot.texture = texture
	dot.scale = Vector2(0.05,0.05)
	dot.position = Vector2(pos.x*step,pos.y*-1*step)
	dot.name = str(pos.x)+"_"+str(pos.y*-1)
	$Points.add_child(dot)

func add_line(pos1:Vector2,pos2:Vector2) -> void:
	remove_line()
	var line:Line2D = Line2D.new()
	line.add_point(Vector2(pos1.x*step,pos1.y*-1*step))
	line.add_point(Vector2(pos2.x*step,pos2.y*-1*step))
	line.width = 5
	line.default_color = Color.hex(0x1f90ea)
	$Line.add_child(line)

func remove_point(pos:Vector2) -> void:
	var point: Sprite2D = $Points.get_node(str(pos.x)+"_"+str(pos.y*-1))
	if point != null:
		point.queue_free()

func remove_line() -> void:
	for i in $Line.get_children():
		i.queue_free()

func remove_all_points() -> void:
	for i in $Points.get_children():
		i.queue_free()

func zoom_change(direction:String) -> void:
	if direction == "in" and $Camera_Target/Camera2D.zoom.x < 1:
		$Camera_Target/Camera2D.zoom += Vector2(0.1,0.1)
	elif direction == "out" and $Camera_Target/Camera2D.zoom.x > 0.1:
		$Camera_Target/Camera2D.zoom -= Vector2(0.1,0.1)



#======================================== Graph ========================================
## Essa função criar os Numeros nos eixos
func create_labels_axis() -> void:
	for i in range(-1*max_x,max_x+1):
		var label = Label.new()
		label.name=("x_"+str(i))
		label.text = str(i)
		label.position = Vector2((i*step)+3,0)
		
		$Labels/x.add_child(label)
		
	for i in range(-1*max_y,max_y+1):
		if i != 0:
			var label = Label.new()
			
			label.name=("y_"+str(i))
			label.text = str(i*-1)
			
			label.position = Vector2(0,(i*step))
			label.position -= Vector2(label.size.x+3,label.size.y)
			
			$Labels/y.add_child(label)


## Essa função cria o grafico no plano 
func draw_bg_graph() -> void:
	#draw main x line
	draw_line(Vector2(0,-1*step*max_x),Vector2(0,step*max_x),Color.WHITE,2.5)
	
	#draw main y line
	draw_line(Vector2(-1*step*max_y,0),Vector2(step*max_y,0),Color.WHITE,2.5)
	
	
	#draw auxiliar lines x
	for i in range(-1*max_x,max_x+1):
		draw_line(Vector2(i*step,max_y*step*-1),Vector2(i*step,max_y*step),Color.WHITE,1.0)
	
	#draw auxiliar line y
	for i in range(-1*max_y,max_y+1):
		draw_line(Vector2(max_x*step*-1,i*step),Vector2(max_x*step,i*step),Color.WHITE,1.0)


