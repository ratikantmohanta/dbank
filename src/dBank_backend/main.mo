import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var startTime = Time.now();

  stable var currentValue : Float = 00;

  //  currentValue := 100;

  let id = 2348923840928349;

  // Debug.print(debug_show (id));

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print(debug_show ("Amount too large"));
    };
  };

  public query func checkBalance() : async Float {
    return currentValue;
  };

  // topUp();

  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  public func compund() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };

};
