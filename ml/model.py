import tensorflow as tf
import nltk
import numpy as np
import pandas as pd

import nltk
nltk.download('brown')
from nltk.corpus import brown
data = brown.sents()

print(data[:5])

# Implementing Preprocessing:

import string
from nltk.corpus import stopwords
nltk.download('stopwords')

def preprocess(data):
    stop_words = set(stopwords.words('english'))
    processed_data = []
    for sentence in data:
        sentence = [word.lower() for word in sentence if word.isalpha()]
        sentence = [word for word in sentence if word not in stop_words]
        processed_data.append(sentence)
    return processed_data

processed_data = preprocess(data)

# Defining the Model:

from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, LSTM, Dense
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences

tokenizer = Tokenizer()
tokenizer.fit_on_texts(processed_data)
sequences = tokenizer.texts_to_sequences(processed_data)

print('finished step1')
# Creating Input and Output Pairs:

input_sequences = []
for sequence in sequences:
    for i in range(1, len(sequence)):
        n_gram_sequence = sequence[:i+1]
        input_sequences.append(n_gram_sequence)
max_seq_length = max([len(seq) for seq in input_sequences])
input_sequences = pad_sequences(input_sequences, maxlen=max_seq_length, padding='pre')


vocab_size = len(tokenizer.word_index) + 1  # To account for padding token

model = Sequential()
model.add(Embedding(input_dim=vocab_size, output_dim=100, input_length=max_seq_length - 1))
model.add(LSTM(128))
model.add(Dense(vocab_size, activation='softmax'))

import numpy as np

input_sequences = np.array(input_sequences)
X = input_sequences[:, :-1]
y = input_sequences[:, -1]
print('pre encoding')
print(len(y))
print(vocab_size)
# Convert labels to one-hot encoding
y = tf.keras.utils.to_categorical(y, num_classes=vocab_size)
print('pre compile')
model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
print('post compile')

history = model.fit(X, y, epochs=50, batch_size=128, verbose=1)

from datetime import datetime
from uuid import uuid4

eventid = datetime.now().strftime('%Y%m-%d%H-%M%S-') + str(uuid4())
model.save('/usr/local/models/llm.keras')

import matplotlib.pyplot as plt

plt.plot(history.history['accuracy'])
plt.title('Model Accuracy')
plt.ylabel('Accuracy')
plt.xlabel('Epoch')
plt.show()


