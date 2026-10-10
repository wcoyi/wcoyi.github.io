---
title: "Projects"
description: "A collection of my recent work and technical projects."
menu: 
  main:
    weight: 30
---

### Recent Work

<div class="project-grid">

  <div class="project-card">
    <div class="project-icon">🌦️</div>
    <h3>Serene Weather Application</h3>
    <p>An API-integrated Python weather tool built with a PyQt5 graphical user interface, utilizing Object-Oriented Programming and threading for low-resource performance.</p>
    <a href="https://github.com/wcoyi/wcoyi.github.io/releases/download/v1.0.0/SereneWeather.exe" class="project-link">Download for Windows →</a>
  </div>

  <div class="project-card">
    <div class="project-icon">🎮</div>
    <h3>Historical Video Game Encyclopedia Database</h3>
    <p>A five-table relational SQL database designed to document video game franchise history, accompanied by data quality reports and tree classification concepts.</p>
  </div>

  <div class="project-card">
    <div class="project-icon">⚽</div>
    <h3>Football Player Market Value Predictor</h3>
    <p>An end-to-end regression project predicting professional football players' market values from a real-world 48k-record TransferMarkt dataset, adhering to the CRISP-DM framework across data cleaning, feature engineering and model development in Python. Compares Linear Regression, Random Forest, and XGBoost with Lasso-driven feature selection and cross-validated hyperparameter tuning.</p>
  </div>

  <div class="project-card">
    <div class="project-icon">🍷</div>
    <h3>Wine Quality and Type Identification</h3>
    <p>
    A scalable and fault-resistent model with FastAPI deployment that provides accurate predictions to assist product evaluation and identification among winemakers, and those residing in technical departments connected with said specialists. trained via comprehensive and interpretable baseline performers against RandomForestRegressor and GradientBoostClassifier models. </p>
  </div>

</div>

<style>
.project-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
  gap: 1.5rem;
  margin-top: 2rem;
}

.project-card {
  background-color: #0d1420;
  border: 1px solid #1e2a3a;
  border-radius: 10px;
  padding: 1.75rem;
  transition: border-color 0.2s ease;
}

.project-card:hover {
  border-color: #2dd4ff;
}

.project-icon {
  font-size: 1.5rem;
  margin-bottom: 0.75rem;
}

.project-card h3 {
  color: #ffffff;
  font-size: 1.1rem;
  margin: 0 0 0.75rem 0;
}

.project-card p {
  color: #9aa5b1;
  font-size: 0.95rem;
  line-height: 1.6;
  margin: 0;
}

.project-link {
  display: inline-block;
  margin-top: 1rem;
  color: #2dd4ff;
  font-size: 0.9rem;
  text-decoration: none;
}

.project-link:hover {
  text-decoration: underline;
}
</style>

