# exercise01
import numpy
from matplotlib import pyplot
from numpy import median
from scipy import stats

# 1.1.1
myArangeData00 = numpy.arange(100, 200, 1)

# 1.1.2
myArangeData01 = numpy.arange(100, 200, 2)

# 1.1.3
myArangeData02 = numpy.arange(100, 110, 0.5)

# 1.1.4
myNormData00 = numpy.random.normal(0, 1, 100)
myUniData00 = numpy.random.uniform(0, 200, 1000000)

# 2.1

myNormData00Average = myNormData00.mean()
print(myNormData00Average)
#
myNormData00Median = median(myNormData00)
myNormData00Max = myNormData00.max()
myNormData00Min = myNormData00.min()
print("\taverage" + str(myNormData00Average) + "\tmedian " + str(myNormData00Median) + "\tmin " + str(
    myNormData00Min) + "\tmax " + str(myNormData00Max))


#2.2

valvs = stats.t.interval(alpha=0.95, df=len(myNormData00)-1, loc=
                 numpy.mean(myNormData00), scale=
                    stats.sem(myNormData00))

#2.3
myNormData00_x100 = myNormData00 * 100
print(myNormData00_x100)

#2.4
myNormData00_1_to10 = myNormData00[1:10]
print(myNormData00_1_to10)

#2.5
for m in myNormData00:
    if m > 0:
        print(m)


