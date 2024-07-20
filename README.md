<h1>Swasthya - Your personal AI powered Healthcare companion</h1>
<h2>Introduction</h2>
<p>Swasthya is an AI powered health recommendations app which leverages the power of Llama 3 model from Meta.
It holds the power to revolutionize this domain by providing personalized wellness recommendations based upon user’s data and preferences.</p>
<h2>Features</h2>
<ul>
  <li>To use Llama 3 for answering health related doubts</li>
  <li>Dynamic article and video recommendations  based on user’s searches with the chatbot</li>
  <li>To allow users to discover prompt related medical centers near them  </li>
  <li>To save user preferences like previously visited clinics or their medications</li>
</ul>
<h2>TechStack</h2>
<ul>
  <li><strong>Flutter Framework</strong> for frontend, following the <strong>BloC Architecture</strong></li>
  <li><strong>Express JS Framework</strong> for backend, following the <strong>MVC Architecture</strong></li>
  <li><strong>GORQ API</strong> will be used to run <strong>Llama 3 model</strong></li>
</ul>
<h2>Setup (for Frontend)</h2>
<ul>
  <li>Ensure that Flutter SDK is installed and added to path</li>
  <li>Ensure that Dart SDK is installed</li>
  <li>Ensure Flutter and BloC official extensions are installed</li>
  <li>Run <i><strong>flutter pub get</strong></i> to install the required dependencies</li>
   <li>Follow this article : https://medium.com/@hanansani2002/setting-up-flutter-in-visual-studio-code-a-step-by-step-guide-1c64450728a7</li>
</ul>
<h2>Working</h2>
<ul>
  <li>For the very first use, user will be prompted to add general details realated to his health and Google OAuth will be used for user login and registration</li>
  <li>The general details will be stored and sent to the Llama 3 based model for processing and cater to the user's needs based on them</li>
  <li>User will be prompted with articles/videos recommendations on the home screen, fetched from the Web by the model, using user's general details</li>
  <li>These recommendations will drive the user to opt for a better lifestyle</li>
  <li>Then comes the main implementation of AI, the Chat Option, which will allow user to share his health related doubts/questions</li>
  <li>These questions can be wide ranging from medications to nearest hospitals, from belly fat reduction tutorials to diet plans for diabetes patients and much more</li>
  <li>The model at the backend will use these prompts along with user data to generate tailored responses, by fetching the appropriate data</li>
  <li>Moreover, the model will be trained as well to update the recommendations on the Home tab, based upon recent chats</li>
  <li>Furthermore, the user will have the ability to save response snippets for future reference under the Profile tab, along with user's general details</li>
</ul>
