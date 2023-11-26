# -*- coding: utf-8 -*-
"""DataManagement_Final.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1vctWJaee7SqXh6qaiZ9rxHhb1_gc3hU4
"""

#sqlite3
import sqlite3 as sq
import pandas as pd

from google.colab import drive
drive.mount('/content/drive')

dbfile_country = '/content/drive/MyDrive/MBS_coursePractice/MBS_final_project/Wine.db'
connection = sq.connect(dbfile_country)
cursor = connection.cursor()

#query
selectquery = 'SELECT Wine.points, Wine.price, Rater.name \
                FROM Wine \
                JOIN Rater ON Wine.rid = Rater.id'

df = pd.read_sql_query(selectquery, connection)

cursor.close()
connection.close()

grouped_stats = df.groupby('name').agg({
    'points': 'describe',
    'price': 'describe'
})

grouped_stats.columns = ['_'.join(col).strip() for col in grouped_stats.columns.values]

grouped_stats

try:
  grouped_stats.to_excel('rater_name.xlsx')
  print('Finished')
except Exception as e:
  print('Failed')