# Student GitHub Repo Template Guide

This is your starter layout and content guide for building a professional, organized GitHub repository for this course. You can clone this structure, fork it, or build it manually using the same folder and README format.

---

## 📁 Recommended Repo Structure

```bash
3013-Algorithms-LastFirst/
├── Assignments/
│   ├── A01/
│   │   ├── README.md
│   │   └── your_code.ext
│   ├── A02/
│   │   ├── README.md
│   │   └── your_code.ext
│   └── README.md   # table of contents for assignments
├── Resources/
│   └── helpful_links.md (optional)
└── README.md        # profile info, contact, and repo overview
```

---

## 🧾 Top-Level README.md Example

```markdown
## Your Name

### Course: 3013 Algorithms

### Email: your.name@example.com

### GitHub: @yourusername

### About Me

I’m a CS major interested in algorithms, embedded systems, and burritos.

### Photo

<img src="https://images2.imgbox.com/xx/yy/filename.png" width="200">
```

---

## 📑 Assignments/README.md Example

```markdown
# Assignment Index

| #   | Folder        | Description             |
| --- | ------------- | ----------------------- |
| A01 | [A01](./A01/) | GitHub Setup Assignment |
| A02 | [A02](./A02/) | Hello World Project     |
```

---

## 📝 Assignment Folder README.md Example (e.g., `A02/README.md`)

````markdown
## A02 - Hello World

### Student Name

### Description

Basic hello world assignment using Python.

### Files

| #   | File     | Description       |
| --- | -------- | ----------------- |
| 1   | hello.py | Prints hello text |

### Instructions

Run it with:

```bash
python hello.py
```

### Notes

No dependencies. Will crash if run on a potato.
````

---

## 📷 How to Use ImgBox for Hosting Images

ImgBox is a free image hosting service that works well with GitHub READMEs — but you must use the **Direct Link** and not the page URL (which includes ads).

### ✅ Steps to Get the Correct Image URL:

1. Go to [https://imgbox.com](https://imgbox.com)
2. Click **Upload Images**
3. Under settings:
   - **Thumbnail Size** → Select "Do not resize"
   - **Content Type** → Select "Family Safe"
4. Upload your image
5. On the confirmation page:
   - You will see three options. Don't use any of them (unless you know what your doing).
   - Your image should be below as a tumbnail. Click on it.
   - Now take minute to scroll up and down so you can see the adverts.
   - But, were ok. Just `right click` on your image and choose `copy image address`

### ✅ How to Use in Markdown:

That image address you copied gets pasted in an image src tag!

```markdown
<img src="https://images2.imgbox.com/xx/yy/filename.png" width="200">
```

Or:

```markdown
![My Face](https://images2.imgbox.com/xx/yy/filename.png)
```

---

## 🧠 Pro Tips

- Keep your folder names and file names short and lowercase with no spaces.
- Commit often — push once per class day at least.
- Preview your README formatting on GitHub to catch issues.
- Use `.gitignore` to avoid uploading `.DS_Store`, compiled binaries, etc.

---

_Your repo is more than a grade — it’s your dev portfolio. Treat it like you want an internship out of it._
