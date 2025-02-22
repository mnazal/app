# Fake News Detection App

The Fake News Detection App is a mobile application designed to help users identify and flag fake news articles. The app leverages a Random Forest machine learning model to provide accurate and reliable fake news detection.

## Aim

The project was developed to combat the spread of misinformation by providing users with a tool to verify the authenticity of news articles.

## Tech Stack

- **Client:** Flutter
- **Server:** Flask
- **Machine Learning Model:** Random Forest

## Features

- **News Submission:** Users can submit news articles for verification.
- **Real-time Detection:** Integration with a Flask server to process and analyze news articles in real-time.
- 
## Machine Learning Model

The app uses a Random Forest model trained on a dataset of labeled news articles. The model processes various features extracted from the articles to classify them as real or fake.

## Installation

### Prerequisites

- Python 3.x and pip installed
- Flutter installed

### Backend Setup

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/fake-news-detection-app.git
    cd fake-news-detection-app/backend
    ```

2. Create a virtual environment and activate it:
    ```bash
    python3 -m venv venv
    source venv/bin/activate  # On Windows use `venv\Scripts\activate`
    ```

3. Install dependencies:
    ```bash
    pip install -r requirements.txt
    ```



4. Start the Flask server:
    ```bash
    flask run
    ```

### Frontend Setup

1. Navigate to the frontend directory:
    ```bash
    cd ../frontend
    ```

2. Get the Flutter packages:
    ```bash
    flutter pub get
    ```

3. Run the app:
    ```bash
    flutter run
    ```

## Usage

1. Open the app on your mobile device or emulator.
2. Submit a news article by entering the text.
3. Receive real-time feedback on the authenticity of the article.

## License

This project is licensed under the [MIT License](https://choosealicense.com/licenses/mit/).
