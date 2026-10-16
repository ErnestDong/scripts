# %%
import pandas as pd
from pypinyin import lazy_pinyin

df = pd.read_excel("./我的自选股.xlsx")

# %%
df["拼音"] = (
    df["名称"].dropna().apply(lambda x: "".join([i[0] for i in lazy_pinyin(x)]))
)

# %%
content = df[["名称", "拼音"]].to_markdown(index=False)
# %%
with open("replace_rules.txt", "w") as f:
    print(content.replace(" ", "")[31:].replace("|\n|", "\n"), file=f)
# %%
