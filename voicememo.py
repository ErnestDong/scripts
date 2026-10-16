# %%
import sqlite3
import shutil

db = sqlite3.connect("./CloudRecordings.db")
sql = """SELECT ZPATH, ZENCRYPTEDTITLE, ZDATE, ZDURATION FROM ZCLOUDRECORDING ORDER BY ZDATE DESC"""

# %%
result = db.execute(sql).fetchall()
srcdir = (
    "/Users/dcy/Library/Group Containers/group.com.apple.VoiceMemos.shared/Recordings"
)
for i in result:
    if i[0] is None:
        continue
    if "m4a" not in i[0]:
        continue
    shutil.copyfile(f"{srcdir}/{i[0]}", f"./result/{i[1]} {i[0].split()[0]}.m4a")


# %%
