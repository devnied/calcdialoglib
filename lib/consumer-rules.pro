# Consumer ProGuard rules for calcdialoglib.
# These rules are merged into the R8/ProGuard configuration of every app
# that depends on this library, so they MUST stay minimal and correct.

# Keep custom views referenced from XML. Android inflates them by reflection,
# looking for the (Context, AttributeSet) and (Context, AttributeSet, int)
# constructors -- removing or renaming either crashes inflation with
# InflateException at runtime.
-keep public class com.maltaisn.calcdialog.CalcEraseButton {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

# Keep the public dialog API and its callback interface so consumers'
# Activities/Fragments can implement it and so reflection-based callback
# lookup keeps working after minification.
-keep public class com.maltaisn.calcdialog.CalcDialog { *; }
-keep public class com.maltaisn.calcdialog.CalcDialog$CalcDialogCallback { *; }
-keep public class com.maltaisn.calcdialog.CalcSettings { *; }
-keep public enum com.maltaisn.calcdialog.CalcNumpadLayout { *; }

# Parcelable CREATOR fields are looked up reflectively by the framework.
-keepclassmembers class com.maltaisn.calcdialog.** implements android.os.Parcelable {
    public static final ** CREATOR;
}
