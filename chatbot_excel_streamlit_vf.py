import streamlit as st
import pandas as pd
from rapidfuzz import fuzz, process

# Fond dégradé bleu
st.markdown("""
    <style>
    /* Fond dégradé général */
    [data-testid="stAppViewContainer"] {
        background: linear-gradient(135deg, #ffffff, #e6d9ff);
        background-attachment: fixed;
        padding: 20px;
        border: 5px solid black;
        border-radius: 10px;
        box-sizing: border-box;
    }
</style>
    """, unsafe_allow_html=True)

# Logo CCI
col1, col2 = st.columns([5, 1])  

with col2:
    st.image("logo.jpg", width=40) 
    
# Titre
st.title("🤖 Chatbot CCI")

# Question
col1, col2 = st.columns([1, 3])  

with col2: 
    user_input = st.text_input("Quel est votre problème ?")  
    
# Charger le fichier Excel
df = pd.read_excel("problèmes_récurrents.xlsx")


# Extraire les questions
questions = df['Question clé'].tolist()

def get_fuzzy_response(user_input):
    df = pd.read_excel("problèmes_récurrents.xlsx")
    best_match, score, index = process.extractOne(user_input, questions, scorer=fuzz.token_sort_ratio)
    if score > 70:
        response = df.iloc[index]['Réponse']
        return f"La solution à votre problème \"{best_match}\"  est : {response}"
    else:
        return "Désolé, je ne suis pas sûr de comprendre votre question, veuillez la reformuler ou contacter directement la DSI au mail suivant: mail@exemple.fr"

# Affichage des réponses
if user_input:
    response = get_fuzzy_response(user_input)
    
    col1, col2 = st.columns([1, 5])  

    with col1:
        st.image("avatar.jpg", width=50)

    with col2:
       st.markdown(
    f"""
    <div style='
        background-color: #ffffff10;
        padding: 15px;
        border-radius: 10px;
        color: black;
        border: 1px solid black;
        margin-bottom: 10px;
    '>
        {response}
    </div>
    """,
    unsafe_allow_html=True
       )
