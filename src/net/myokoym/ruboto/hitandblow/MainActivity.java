package net.myokoym.ruboto.hitandblow;

public class MainActivity extends org.ruboto.RubotoActivity {
	public void onCreate(android.os.Bundle arg0) {
    try {
      setSplash(Class.forName("net.myokoym.ruboto.hitandblow.R$layout").getField("splash").getInt(null));
    } catch (Exception e) {}

    setScriptName("main_activity.rb");
    super.onCreate(arg0);
  }
}
