# 🐄 FeedSmart Expert System

A Prolog-based expert system that recommends optimal feeding rations for cows based on their category (milk or meat) and weight.

---

## 📋 Features

- **Interactive Consultation**: The system prompts users for cow category and weight.
- **Dynamic Knowledge Base**: Utilizes Prolog's dynamic predicates to store and retrieve user inputs.
- **Tailored Recommendations**: Provides specific feeding rations based on cow attributes.
- **Modular Design**: Organized into facts, rules, and an inference engine for clarity and maintainability.

---

## 🛠️ Getting Started

### Prerequisites

- [SWI-Prolog](https://www.swi-prolog.org/) installed on your system.

### Running the Program

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/CowFeeder-ExpertSystem.git
   cd CowFeeder-ExpertSystem
2.Start SWI-Prolog:
swipl

3.Load the Program:
?- [main].

4.Start the Consultation:
?- feedsmart.


📈 Sample Interaction
Cow category (milk , meat) : milk.
What is the cow weight (Kg) : 450.

Ration(s) :
-> 8kg of forage + 4kg of concentrate + balanced mineral supplement.
