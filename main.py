from pyspark import SparkContext, SparkConf
conf = SparkConf().setAppName("Hello").setMaster("spark://localhost:7077")
sc = SparkContext(conf=conf)
big_list = range(10000)
rdd = sc.parallelize(big_list, 2)
odds = rdd.filter(lambda x: x % 2 != 0)
odds.take(5)
