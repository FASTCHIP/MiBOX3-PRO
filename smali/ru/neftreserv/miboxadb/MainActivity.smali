.class public Lru/neftreserv/miboxadb/MainActivity;
.super Landroid/app/Activity;
.implements Ljava/lang/Runnable;
.source "MainActivity.java"

.field private mText:Landroid/widget/TextView;

.field private mTried:I

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/high16 v1, 0x41c80000

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v1, 0x20

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    iput-object v0, p0, Lru/neftreserv/miboxadb/MainActivity;->mText:Landroid/widget/TextView;

    invoke-direct {p0}, Lru/neftreserv/miboxadb/MainActivity;->render()V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method protected onResume()V
    .registers 3

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    iget-object v0, p0, Lru/neftreserv/miboxadb/MainActivity;->mText:Landroid/widget/TextView;

    if-eqz v0, :cond_ret

    invoke-direct {p0}, Lru/neftreserv/miboxadb/MainActivity;->render()V

    :cond_ret
    return-void
.end method

.method public run()V
    .registers 5

    iget v0, p0, Lru/neftreserv/miboxadb/MainActivity;->mTried:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lru/neftreserv/miboxadb/MainActivity;->mTried:I

    const-string v1, "su"

    const-string v2, "-c"

    const-string v3, "id"

    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/neftreserv/miboxadb/MainActivity;->exec([Ljava/lang/String;)I

    move-result v0
    const-string v1, "root id exit="

    invoke-direct {p0, v1, v0}, Lru/neftreserv/miboxadb/MainActivity;->status(Ljava/lang/String;I)V

    if-eqz v0, :cond_go

    const-string v1, "\u043d\u0435\u0442 root \u2014 \u043d\u0430\u0436\u043c\u0438 \u041f\u0420\u0415\u0414\u041e\u0421\u0422\u0410\u0412\u0418\u0422\u042c \u043d\u0430 \u0442\u0435\u043b\u0435\u0432\u0438\u0437\u043e\u0440\u0435"

    invoke-direct {p0, v1}, Lru/neftreserv/miboxadb/MainActivity;->line(Ljava/lang/String;)V

    iget v0, p0, Lru/neftreserv/miboxadb/MainActivity;->mTried:I

    const/4 v1, 0x6

    if-ge v0, v1, :cond_ret

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    const-wide/16 v2, 0x1f40

    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_ret
    return-void

    :cond_go
    const-string v1, "su"

    const-string v2, "-c"

    const-string v3, "setprop service.adb.tcp.port 5555;setprop persist.adb.tcp.port 5555"

    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/neftreserv/miboxadb/MainActivity;->exec([Ljava/lang/String;)I

    move-result v0
    const-string v1, "tcp port prop exit="

    invoke-direct {p0, v1, v0}, Lru/neftreserv/miboxadb/MainActivity;->status(Ljava/lang/String;I)V

    const-string v1, "su"

    const-string v2, "-c"

    const-string v3, "stop adbd;start adbd"

    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/neftreserv/miboxadb/MainActivity;->exec([Ljava/lang/String;)I

    move-result v0
    const-string v1, "adbd restart exit="

    invoke-direct {p0, v1, v0}, Lru/neftreserv/miboxadb/MainActivity;->status(Ljava/lang/String;I)V

    invoke-direct {p0}, Lru/neftreserv/miboxadb/MainActivity;->refresh()V

    return-void
.end method

.method private exec([Ljava/lang/String;)I
    .registers 4

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Process;->waitFor()I

    move-result v1

    return v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :cond_fail

    :cond_fail
    const/16 v1, -0x3e7

    return v1
.end method

.method private addrOf(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    :try_start_0
    invoke-static {p1}, Ljava/net/NetworkInterface;->getByName(Ljava/lang/String;)Ljava/net/NetworkInterface;

    move-result-object v0

    if-eqz v0, :cond_none

    invoke-virtual {v0}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_none

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetAddress;

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :cond_none

    :cond_none
    const-string v0, "?"

    return-object v0
.end method

.method private status(Ljava/lang/String;I)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/neftreserv/miboxadb/MainActivity;->line(Ljava/lang/String;)V

    return-void
.end method

.method private line(Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lru/neftreserv/miboxadb/MainActivity;->mText:Landroid/widget/TextView;

    if-eqz v0, :cond_ret

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v1, "\n> "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0, v1}, Lru/neftreserv/miboxadb/MainActivity;->log(Ljava/lang/String;)V

    :cond_ret
    return-void
.end method

.method private flag(Ljava/lang/String;)I
    .registers 4

    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private prop(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    :try_start_0
    invoke-static {p1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :cond_fail

    :cond_fail
    const-string v0, "<denied>"

    return-object v0
.end method

.method private log(Ljava/lang/String;)V
    .registers 3

    const-string v0, "MiBoxADB"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return-void
.end method

.method private version()Ljava/lang/String;
    .registers 4

    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    return-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :cond_fail

    :cond_fail
    const-string v0, "?"

    return-object v0
.end method

.method private refresh()V
    .registers 4

    iget-object v0, p0, Lru/neftreserv/miboxadb/MainActivity;->mText:Landroid/widget/TextView;

    if-eqz v0, :cond_ret

    invoke-direct {p0}, Lru/neftreserv/miboxadb/MainActivity;->render()V

    :cond_ret
    return-void
.end method

.method private render()V
    .registers 9

    iget-object v0, p0, Lru/neftreserv/miboxadb/MainActivity;->mText:Landroid/widget/TextView;

    if-eqz v0, :cond_ret

    invoke-direct {p0}, Lru/neftreserv/miboxadb/MainActivity;->diag()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lru/neftreserv/miboxadb/MainActivity;->log(Ljava/lang/String;)V

    const-string v2, "\n\n\u0430\u0432\u0442\u043e\u0440:"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_plain

    new-instance v3, Landroid/text/SpannableString;

    invoke-direct {v3, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance v4, Landroid/text/style/RelativeSizeSpan;

    const/high16 v5, 0x3f190000

    invoke-direct {v4, v5}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    const v6, -0x777778

    invoke-direct {v5, v6}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0x11

    invoke-interface {v3, v4, v2, v6, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    invoke-interface {v3, v5, v2, v6, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    move-object v1, v3

    :cond_plain
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_ret
    return-void
.end method

.method private diag()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MiBox ADB "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lru/neftreserv/miboxadb/MainActivity;->version()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v1, "\n\u0442\u0440\u0435\u0431\u0443\u0435\u0442\u0441\u044f root (Patchwall). \u041f\u043e\u0441\u043b\u0435 \u0437\u0430\u043f\u0443\u0441\u043a\u0430 \u043f\u0440\u0438\u0441\u0442\u0430\u0432\u043a\u0430 \u0436\u0434\u0451\u0442 adb \u043d\u0430 \u043f\u043e\u0440\u0442\u0443 5555 \u0438 \u043f\u043e\u0441\u043b\u0435 \u043f\u0435\u0440\u0435\u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0438.\nMODEL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v1, "  SDK="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\nADB_ENABLED="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v1, "adb_enabled"

    invoke-direct {p0, v1}, Lru/neftreserv/miboxadb/MainActivity;->flag(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "  tcp.port="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v1, "service.adb.tcp.port"

    invoke-direct {p0, v1}, Lru/neftreserv/miboxadb/MainActivity;->prop(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v1, "/  persist="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v1, "persist.adb.tcp.port"

    invoke-direct {p0, v1}, Lru/neftreserv/miboxadb/MainActivity;->prop(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v1, "  adbd="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v1, "init.svc.adbd"

    invoke-direct {p0, v1}, Lru/neftreserv/miboxadb/MainActivity;->prop(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v1, "\nIP wlan0="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;
    const-string v1, "dhcp.wlan0.ipaddress"

    invoke-direct {p0, v1}, Lru/neftreserv/miboxadb/MainActivity;->prop(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;
    const-string v1, " / eth0="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;
    const-string v1, "dhcp.eth0.ipaddress"

    invoke-direct {p0, v1}, Lru/neftreserv/miboxadb/MainActivity;->prop(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;
    const-string v1, "\n\n\u0430\u0432\u0442\u043e\u0440: FASTCHIP (github.com/FASTCHIP)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
