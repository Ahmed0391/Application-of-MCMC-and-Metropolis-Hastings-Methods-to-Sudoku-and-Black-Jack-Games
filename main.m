deck =["2","3","4","5","6","7","8","9","10",
    "J","Q","K","A",
    "2","3","4","5","6","7","8","9","10",
    "J","Q","K","A",
    "2","3","4","5","6","7","8","9","10",
    "J","Q","K","A",
    "2","3","4","5","6","7","8","9","10",
    "J","Q","K","A"];


evaluatePolicy("Policy 0: Always draw", @policy, 1000);
%evaluatePolicy("Policy 1: Stick on 17+", @policy1, 30);
%evaluatePolicy("Policy 2: Stick on Hard 17+", @policy2, 1000);
%evaluatePolicy("Policy 3: Always Stick", @policy3, 1000);
%evaluatePolicy("Policy 4: Hit under 15", @policy4, 1000);
%evaluatePolicy("Policy 5: Hit under 19 (aggressive)", @policy5, 1000);

