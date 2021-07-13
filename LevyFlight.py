#!/usr/bin/env python

import turtle as tt
import numpy
import random

for i in range(0, 5000):
    randturn = random.randint(0,360)
    #randmove = numpy.random.normal(1, 5)  # Brownian motion
    randmove = numpy.random.pareto(1.7)   # Levy flight
    tt.left(randturn)
    tt.forward(randmove)
    print abs(tt.pos())
tt.done()    






