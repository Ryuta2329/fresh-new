import random

class Dice:
	def __init__(self) :
		self.wgd_face = None

	def roll(self) :
		face = random.choice([1, 2, 3, 4, 5, 6])
		if self.wgd_face is None : return face
		else : return self.make_trap(face)

	def setWeight_Face(self, face : int) :
		self.wgd_face = face

	def make_trap(self, face : int) :
		if face != self.wgd_face :
			if random.random() < 0.25 : return face
		return self.wgd_face


dice_one = Dice()
result = [0, 0, 0, 0, 0, 0]

for roll in range(1000) :
	face = dice_one.roll()
	result[face - 1] += 1

# Trucando el dado...
# Digamos, que 5 salga con más frecuencia
dice_one.setWeight_Face(5)
res_trap = [0, 0, 0, 0, 0, 0]

for roll in range(1000) :
	face = dice_one.roll()
	res_trap[face - 1] += 1
		
print("El dado sin trampa: ", result)
print("Trucandolo: ", res_trap)