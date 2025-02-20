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

import keras

model = Sequential()
model = keras.saving.load_model('/usr/local/models/llm.keras')

def generate_text(seed_text, next_words):
    for _ in range(next_words):
        token_list = tokenizer.texts_to_sequences([seed_text])[0]
        token_list = pad_sequences([token_list], maxlen=max_seq_length - 1, padding='pre')
        predicted = model.predict(token_list, verbose=0)
        predicted_word_index = np.argmax(predicted, axis=1)[0]
        predicted_word = tokenizer.index_word[predicted_word_index]
        seed_text += " " + predicted_word
    return seed_text

from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/generate', methods=['POST'])
def generate():
    data = request.get_json()
    seed_text = data['seed_text']
    next_words = data.get('next_words', 5)
    generated_text = generate_text(seed_text, next_words)
    return jsonify({'generated_text': generated_text})

@app.route('/health')
def health():
    resp = jsonify(health="healthy")
    resp.status_code = 200
    return resp

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)



