from flask import Flask, request, jsonify
import pickle
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Load the pickled model
with open('model.pkl', 'rb') as f:
    model = pickle.load(f)

# Define API endpoint for prediction
@app.route('/predict', methods=['POST'])
def predict():
    # Get input data from request
    data = request.get_json()

    # Extract text from input data
    text = data['text']

    # Perform prediction using the loaded model
    prediction = model.predict([text])  # Assuming the model expects a list of texts
    print(prediction.tolist())
    # Return prediction as JSON
    return jsonify({'prediction': prediction.tolist()})

if __name__ == '__main__':
    app.run(debug=True)
