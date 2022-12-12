import datetime as dt

def update_hero_title():
    pyscript.write('hero-title', f"Reach out to Luchonio to have your own cartoon characters made.  {dt.date.today().strftime('%A %B %d, %Y')}")

update_hero_title()