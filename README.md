1. Configurar el Rebote (Pelota)
Por defecto, los objetos en Godot pierden energía al chocar. Para evitarlo:

    Seleccioná el RigidBody2D (pelota).
    En el Inspector, buscá la propiedad Physics Material Override.
    Hacé clic en "[vacío]" y seleccioná Nuevo PhysicsMaterial.
    Hacé clic sobre el nuevo material para abrir sus opciones:
        Friction (Fricción): 0 (para que no se frene al rozar paredes).
        Bounce (Rebote): 1 (para que devuelva toda la fuerza del impacto).

2. Configurar la Pelota (RigidBody2D)
En el Inspector de la pelota, asegurate de tener estos valores:

    Gravity Scale: 0 (importante para que no se caiga sola).
    Lock Rotation: Activado (opcional, para que la pelota no gire sobre sí misma al chocar).
    Continuous CD: Cast Shape (esto evita que la pelota "atraviese" las paredes si va muy rápido).

3. Crear los Límites (Paredes)
Para que la pelota no se escape de la pantalla:

    Añadí un nodo StaticBody2D a tu escena principal (llamalo "Paredes").
    Agregale tres nodos CollisionShape2D como hijos:
        Uno para el techo (arriba).
        Uno para el lateral izquierdo.
        Uno para el lateral derecho.
    Ajustalos a los bordes de tu pantalla. No pongas colisión en el suelo (abajo) para que la pelota se pierda si no la atajás.

4. Configurar la Barra (CharacterBody2D)
La barra ya detecta colisiones por defecto al usar move_and_slide(). Solo asegurate de que tenga un CollisionShape2D que cubra todo su sprite.
