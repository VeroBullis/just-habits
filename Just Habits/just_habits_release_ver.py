"""
Just Habits program
Author: Vero Bullis
03 Feb. 2024
"""

import tkinter as tk
from tkinter import messagebox
import json
import datetime as dt

HABIT_FILE_NAME = "habits.json"
STREAK_FILE_NAME = "streak.txt"

NORMAL_BACKGROUND_COLOR = "#e4e7e7"
NORMAL_TEXT_COLOR = "#e4e7e7"
HIGHLIGHT_BACKGROUND_COLOR = "#fffab3"
HIGHLIGHT_TEXT_COLOR = "#fffab3"

DEFAULT_FONT = "Cascadia Mono"

GRACE_PERIOD = 2  # Number of days before streak reset


class MainFrame(tk.Frame):
    """
    The frame on the main window containing the plant image and navigation
    buttons.
    """

    def __init__(self, parent, image_file, habit_list, main_canvas_frame):
        """
        MainFrame constructor.

        parent: (type tk.Frame) The parent frame of this frame.
        image_file: (type str) The name of an image file to be shown on the main
        screen.
        habit_list: (type list[dict]) A list of dictionaries containing habit information.
        main_canvas_frame: (type tk.Frame) The instance of the ScrollingCanvasFrame
        on the main canvas.
        """

        tk.Frame.__init__(self, parent)

        # Initialize attributes
        self.parent = parent
        self.habit_list = habit_list
        self.main_canvas_frame = main_canvas_frame

        # Create widgets
        self.plant_image = tk.PhotoImage(file=image_file)
        self.lbl_plant_image = tk.Label(self,
                                        image=self.plant_image,
                                        bg=NORMAL_BACKGROUND_COLOR)
        self.btn_manage_habits = tk.Button(self,
                                           text="Manage Habits",
                                           command=self.open_edit_window,
                                           font=(DEFAULT_FONT, 10))

        # Add widgets to grid
        self.lbl_plant_image.grid(column=1, row=1, padx=10)
        self.btn_manage_habits.grid(column=1, row=2)

    def open_edit_window(self):
        """
        Creates a new Toplevel window for habit editing.
        """

        edit_window = EditWindow(
            parent=self.parent,
            habit_list=self.habit_list,
            main_canvas_frame=self.main_canvas_frame)


class ScrollingCanvasFrame(tk.Frame):
    """
    A frame containing a scrollable list of habits in a canvas.
    """

    CANVAS_WIDTH = 275  # Width of the canvas object
    CANVAS_HEIGHT = 200  # Height of the canvas object

    def __init__(self, parent, habit_list, main_canvas_frame, current_date=None, active_streak_list=None, habit_type="main"):
        """
        ScrollingCanvasFrame constructor.

        parent: (type tk.Frame) The parent frame of this frame.
        habit_list: (type list[dict]) A list of dictionaries containing habit information.
        main_canvas_frame: (type tk.Frame) The instance of the ScrollingCanvasFrame
        on the main canvas.
        current_date: (type dt.datetime) The current date as a dt.datetime object.
        active_streak_list: (type list[dt.datetime]) A list of all days the user
        was active in their current streak.
        habit_type: (type str) The type of habit frame to display on the canvas:
        "main" for HabitFrame, "edit" for EditFrame.
        """

        tk.Frame.__init__(self, parent)

        #Initialize attributes
        self.parent = parent
        self.habit_list = habit_list
        self.main_canvas_frame = main_canvas_frame
        self.current_date = current_date
        self.active_streak_list = active_streak_list
        self.habit_type = habit_type

        # Create widgets
        self.habit_canvas = tk.Canvas(
            self,
            height=self.CANVAS_HEIGHT,
            width=self.CANVAS_WIDTH)
        self.habit_scroll = tk.Scrollbar(self, orient=tk.VERTICAL)
        self.habit_list_frame = HabitListFrame(
            parent=self.habit_canvas,
            habit_list=self.habit_list,
            main_canvas_frame=self.main_canvas_frame,
            edit_canvas_frame=self,
            habit_type=self.habit_type,
            active_streak_list=active_streak_list,
            current_date=self.current_date)
        self.habit_canvas.create_window((0, 0),
                                        window=self.habit_list_frame,
                                        width=self.CANVAS_WIDTH,
                                        anchor="nw")

        # Configure habit_canvas scrollregion
        self.parent.update()
        self.habit_canvas.configure(scrollregion=self.habit_canvas.bbox("all"))

        # Add widgets to grid
        self.habit_canvas.grid(column=0, row=0, padx=10)
        self.habit_scroll.grid(column=1, row=0, sticky="ns")

        # Configure scroll command
        self.habit_scroll.configure(command=self.habit_canvas.yview)
        self.habit_canvas.configure(yscrollcommand=self.habit_scroll.set)

    def refresh(self):
        """
        Refreshes the contents of the habit_canvas, showing all current habits.
        """

        self.habit_canvas.delete("all")

        # Re-create habit_list_frame with updated habits
        self.habit_list_frame = HabitListFrame(
            parent=self.habit_canvas,
            habit_list=self.habit_list,
            main_canvas_frame=self.main_canvas_frame,
            edit_canvas_frame=self,
            habit_type=self.habit_type,
            active_streak_list=self.active_streak_list,
            current_date=self.current_date)
        self.habit_canvas.create_window((0, 0),
                                        window=self.habit_list_frame,
                                        width=self.CANVAS_WIDTH,
                                        anchor="nw")

        # Re-configure habit_canvas scrollregion
        self.parent.update()
        self.habit_canvas.configure(scrollregion=self.habit_canvas.bbox("all"))

        self.habit_canvas.grid(column=0, row=0)


class HabitListFrame(ScrollingCanvasFrame):
    """
    A frame on a canvas containing a list of all habits.
    """

    def __init__(self, parent, habit_list, active_streak_list=None, current_date=None, main_canvas_frame=None, edit_canvas_frame=None, habit_type="main"):
        """
        HabitListFrame constructor.

        parent: (type tk.Canvas) The parent canvas of this frame.
        habit_list: (type list[dict]) A list of dictionaries containing habit information.
        habit_type: (type str) The type of habit frame to display on the canvas:
        "main" for HabitFrame, "edit" for EditFrame.
        main_canvas_frame: (type tk.Frame) The instance of the ScrollingCanvasFrame
        on the main canvas.
        edit_canvas_frame: (type tk.Frame) The instance of the ScrollingCanvasFrame
        on the editing canvas.
        current_date: (type dt.datetime) The current date as a dt.datetime object.
        active_streak_list: (type list[dt.datetime]) A list of all days the user
        was active in their current streak.
        """

        tk.Frame.__init__(self, parent, width=super().CANVAS_WIDTH)

        self.habit_frame_list = []

        # Append a habit_frame to habit_frame_list for every habit in habit_list
        for habit in habit_list:
            if habit_type == "main":
                if current_date.strftime("%a") in habit["weekdays"]:
                    self.habit_frame_list.append(HabitFrame(parent=self,
                                                            habit=habit,
                                                            current_date=current_date,
                                                            active_streak_list=active_streak_list))
            elif habit_type == "edit":
                self.habit_frame_list.append(EditFrame(
                    parent=self,
                    habit_list=habit_list,
                    habit=habit,
                    main_canvas_frame=main_canvas_frame,
                    edit_canvas_frame=edit_canvas_frame))

        # Add widgets to grid
        for i in range(len(self.habit_frame_list)):
            self.habit_frame_list[i].grid(column=0, row=i, pady=1)


class HabitFrame(HabitListFrame):
    """
    A frame containing an individual habit's information.
    """

    def __init__(self, parent, habit, current_date, active_streak_list):
        """
        HabitFrame constructor.

        parent: (type tk.Frame) The parent frame of this frame.
        habit: (type dict) A dictionary containing an individual habit's information.
        current_date: (type dt.datetime) The current date as a dt.datetime object.
        active_streak_list: (type list[dt.datetime]) A list of all days the user
        was active in their current streak.
        """

        tk.Frame.__init__(self, parent, width=super().CANVAS_WIDTH, bg=NORMAL_BACKGROUND_COLOR)

        # Initialize attributes
        self.habit = habit
        self.current_date = current_date
        self.active_streak_list = active_streak_list

        # Create widgets
        self.frm_labels = tk.Frame(self, bg=NORMAL_BACKGROUND_COLOR)
        self.lbl_habit_name = tk.Label(self.frm_labels,
                                       text=habit["name"],
                                       bg=NORMAL_TEXT_COLOR,
                                       font=(DEFAULT_FONT, 10))
        self.lbl_note = tk.Label(self.frm_labels,
                                 text=habit["note"],
                                 bg=NORMAL_TEXT_COLOR,
                                 font=(DEFAULT_FONT, 8))
        self.lbl_habit_name.grid(column=0, row=0, sticky="w")
        self.lbl_note.grid(column=0, row=1, sticky="w")
        self.frm_checkbox = tk.Frame(self)
        self.complete_checked = tk.BooleanVar()
        self.check_completed = tk.Checkbutton(self.frm_checkbox,
                                              variable=self.complete_checked,
                                              command=self.habit_checked)

        # Mark habit as checked if it has been completed today
        if habit["checked"]:
            self.check_completed.select()

        # Make widget backgrounds yellow if habit is highlighted
        if habit["highlight"]:
            self.config(bg=HIGHLIGHT_BACKGROUND_COLOR)
            self.frm_labels.config(bg=HIGHLIGHT_BACKGROUND_COLOR)
            self.lbl_habit_name.config(bg=HIGHLIGHT_TEXT_COLOR)
            self.lbl_note.config(bg=HIGHLIGHT_TEXT_COLOR)

        # Add widgets to grid
        self.check_completed.pack(fill=tk.X)
        self.columnconfigure(0, minsize=(super().CANVAS_WIDTH) - 20)
        self.frm_labels.grid(column=0, row=0, sticky="w")
        self.frm_checkbox.grid(column=1, row=0, sticky="e")

    def habit_checked(self):
        """
        Adds current_date to the active_streak_list, extending the streak.
        Sets the current date as the date last checked in the habit dictionary.
        """

        if self.active_streak_list[-1].strftime("%Y-%m-%d") != self.current_date.strftime("%Y-%m-%d"):
            self.active_streak_list.append(self.current_date)

        self.habit["checked"] = self.complete_checked.get()


class EditFrame(HabitListFrame):
    """
    A frame allowing for an individual habit to be edited.
    """

    def __init__(self, parent, habit_list, habit, main_canvas_frame, edit_canvas_frame):
        """
        EditFrame constructor.

        parent: (type tk.Frame) The parent frame of this frame.
        habit_list: (type list[dict]) A list of dictionaries containing habit information.
        habit: (type dict) A dictionary containing an individual habit's information.
        main_canvas_frame: (type tk.Frame) The instance of the ScrollingCanvasFrame
        on the main canvas.
        edit_canvas_frame: (type tk.Frame) The instance of the ScrollingCanvasFrame
        on the editing canvas.
        """

        tk.Frame.__init__(self, parent, width=super().CANVAS_WIDTH, bg=NORMAL_BACKGROUND_COLOR)

        # Initialize attributes
        self.parent = parent
        self.habit_list = habit_list
        self.habit = habit
        self.main_canvas_frame = main_canvas_frame
        self.edit_canvas_frame = edit_canvas_frame

        # Create widgets
        self.lbl_habit_name = tk.Label(self,
                                       text=habit["name"],
                                       font=(DEFAULT_FONT, 10),
                                       bg=NORMAL_TEXT_COLOR)
        self.btn_edit = tk.Button(self,
                                  text="Edit",
                                  command=lambda: self.open_habit_window(),
                                  font=(DEFAULT_FONT, 10))
        self.btn_delete = tk.Button(self,
                                    text="X",
                                    command=lambda: self.delete_prompt(),
                                    font=(DEFAULT_FONT, 10))
        self.change_index_frame = tk.Frame(self)
        self.btn_up = tk.Button(self.change_index_frame,
                                text="↑",
                                command=lambda: self.change_index(-1),
                                font=(DEFAULT_FONT, 7))
        self.btn_down = tk.Button(self.change_index_frame,
                                  text="↓",
                                  command=lambda: self.change_index(1),
                                  font=(DEFAULT_FONT, 7))

        # Add widgets to grid
        self.btn_up.pack()
        self.btn_down.pack()
        self.columnconfigure(0, minsize=(super().CANVAS_WIDTH) - 85)
        self.lbl_habit_name.grid(column=0, row=0, sticky="w")
        self.btn_edit.grid(column=1, row=0, sticky="e")
        self.btn_delete.grid(column=2, row=0, sticky="e")
        self.change_index_frame.grid(column=3, row=0)

    def change_index(self, modifier):
        """
        Changes the index of the current habit.
        
        modifier: (type int) The amount of indices a habit should be moved in the list.
        """

        old_index = self.habit_list.index(self.habit)
        new_index = old_index + modifier

        # Switches the habits in old_index and new_index, if possible
        if new_index >= 0 and new_index < len(self.habit_list):
            self.habit_list[old_index] = self.habit_list[new_index]
            self.habit_list[new_index] = self.habit
            self.main_canvas_frame.refresh()
            self.edit_canvas_frame.refresh()

    def open_habit_window(self):
        """
        Creates a new Toplevel window for habit information to be changed.
        """

        habit_window = HabitWindow(
            parent=self.parent,
            habit_list=self.habit_list,
            main_canvas_frame=self.main_canvas_frame,
            habit=self.habit,
            edit_canvas_frame=self.edit_canvas_frame)

    def delete_prompt(self):
        """
        Prompts the user with a popup to confirm if they wish to delete the habit.
        Deletes the specified habit if OK is selected.
        """

        # Create messagebox
        confirm_delete = tk.messagebox.askokcancel(
            icon=tk.messagebox.INFO,
            title="Are you sure?",
            message=f"Delete {self.habit['name']}?")

        # Remove habit from habit_list and refresh canvases if OK is selected
        if confirm_delete:
            self.habit_list.remove(self.habit)
            self.main_canvas_frame.refresh()
            self.edit_canvas_frame.refresh()


class MainWindow(tk.Frame):
    """
    The main frame of the root window containing the MainFrame and
    ScrollingCanvasFrame.
    """

    def __init__(self, parent, image_file, habit_list, current_date, active_streak_list):
        """
        MainWindow constructor.

        parent: (type tk.Tk) The parent window of this frame.
        image_file: (type str) The name of an image file to be shown on the main
        screen.
        habit_list: (type list[dict]) A list of dictionaries containing habit information.
        current_date: (type dt.datetime) The current date as a dt.datetime object.
        active_streak_list: (type list[dt.datetime]) A list of all days the user
        was active in their current streak.
        """

        tk.Frame.__init__(self, parent)

        # Create content frames
        self.canvas_frame = ScrollingCanvasFrame(parent=self,
                                                 habit_list=habit_list,
                                                 main_canvas_frame=self,
                                                 current_date=current_date,
                                                 active_streak_list=active_streak_list)
        self.main_frame = MainFrame(parent=self,
                                    image_file=image_file,
                                    habit_list=habit_list,
                                    main_canvas_frame=self.canvas_frame)

        # Add frames to grid
        self.main_frame.grid(column=0, row=0)
        self.canvas_frame.grid(column=0, row=1)


class CreateHabitFrame(tk.Frame):
    """
    The main frame of the habit creation window.
    """

    NAME_CHARACTER_LIMIT = 22 # Character limit of the habit name
    NOTE_CHARACTER_LIMIT = 35 # Character limit of the habit note

    def __init__(self, parent, habit_list, main_canvas_frame, edit_canvas_frame, habit=None):
        """
        CreateHabitFrame constructor.

        parent: (type tk.Frame) The parent frame of this frame.
        habit_list: (type list[dict]) A list of dictionaries containing habit information.
        main_canvas_frame: (type tk.Frame) The instance of the ScrollingCanvasFrame
        on the main canvas.
        edit_canvas_frame: (type tk.Frame) The instance of the ScrollingCanvasFrame
        on the editing canvas.
        habit: (type dict) A dictionary containing an individual habit's information.
        """

        tk.Frame.__init__(self, parent)

        # Initialize attributes
        self.habit_list = habit_list
        self.main_canvas_frame = main_canvas_frame
        self.edit_canvas_frame = edit_canvas_frame
        self.habit = habit

        # Create variables for widgets
        self.name_text = tk.StringVar()
        self.note_text = tk.StringVar()
        self.highlight_checked = tk.BooleanVar()

        # Create widgets
        self.lbl_habit_name = tk.Label(self,
                                       text="Habit Name: ",
                                       font=(DEFAULT_FONT, 10))
        self.lbl_note = tk.Label(self,
                                 text="Note: ",
                                 font=(DEFAULT_FONT, 10))
        self.lbl_repeat = tk.Label(self,
                                   text="Repeat on:",
                                   font=(DEFAULT_FONT, 10))
        self.ent_habit_name = tk.Entry(self,
                                       width=self.NAME_CHARACTER_LIMIT,
                                       textvariable=self.name_text,
                                       font=(DEFAULT_FONT, 10))
        self.ent_note = tk.Entry(self,
                                 width=25,
                                 textvariable=self.note_text,
                                 font=(DEFAULT_FONT, 10))
        self.check_highlight = tk.Checkbutton(self,
                                              text="Highlight",
                                              onvalue=True,
                                              offvalue=False,
                                              variable=self.highlight_checked,
                                              font=(DEFAULT_FONT, 10))
        self.btn_done = tk.Button(self,
                                  text="Done",
                                  width=10,
                                  command=self.habit_done,
                                  font=(DEFAULT_FONT, 10))
        self.weekday_select_frame = WeekdaySelectFrame(self, habit)

        # Fill in pre-existing values if an existing habit is being altered
        if habit:
            self.ent_habit_name.insert(index=0, string=habit["name"])
            self.ent_note.insert(index=0, string=habit["note"])
            self.highlight_checked.set(habit["highlight"])

        # Add widgets to grid
        self.lbl_habit_name.grid(column=0, row=0, sticky="w")
        self.ent_habit_name.grid(column=1, row=0, columnspan=2, sticky="w")
        self.lbl_note.grid(column=0, row=1, sticky="w")
        self.ent_note.grid(column=1, row=1, columnspan=3, sticky="w")
        self.lbl_repeat.grid(column=0, row=2, pady=(10, 0), sticky="w")
        self.weekday_select_frame.grid(column=0, row=3, pady=(0, 10), columnspan=2)
        self.check_highlight.grid(column=0, row=4, sticky="w")
        self.btn_done.grid(column=1, row=4, pady=5, sticky="n")

        # Configure entry character limits
        self.name_text.trace("w", lambda *args: self.character_limit(self.name_text, self.NAME_CHARACTER_LIMIT))
        self.note_text.trace("w", lambda *args: self.character_limit(self.note_text, self.NOTE_CHARACTER_LIMIT))

    def character_limit(self, text, limit):
        """
        Ensures that text is under the character limit.
        
        text: (type tk.StringVar) The String variable of an Entry widget.
        limit: (type int) The character limit of an entry widget.
        """

        if len(text.get()) > limit:
            text.set(text.get()[:limit])

    def habit_done(self):
        """
        Completes habit creation. Stores all entered values in habits, refreshes
        the canvas_frames, and destroys the habit creation window.
        """

        # Get habit attributes from widgets
        name = self.ent_habit_name.get()
        note = self.ent_note.get()
        weekdays = self.weekday_select_frame.get_weekdays()
        highlight = self.highlight_checked.get()

        # Insert habit into the correct index of habit_list
        if self.habit:
            index = self.habit_list.index(self.habit)
            self.habit_list.remove(self.habit)
        else:
            index = len(self.habit_list)

        self.habit_list.insert(
            index,
            {
                "name": name,
                "note": note,
                "weekdays": weekdays,
                "highlight": highlight,
                "checked": False
            }
        )

        self.edit_canvas_frame.refresh()
        self.main_canvas_frame.refresh()

        self.winfo_toplevel().destroy()


class WeekdaySelectFrame(tk.Frame):
    """
    The frame containing the weekday selection interface.
    """

    WEEKDAYS_CHAR = ["S", "M", "T", "W", "T", "F", "S"]  # Days of the week as single characters
    WEEKDAYS_STR = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]  # Days of the week as 3-character strings

    def __init__(self, parent, habit=None):
        """
        WeekdaySelectFrame constructor.

        parent: (type tk.Frame) The parent frame of this frame.
        habit: (type dict) A dictionary containing an individual habit's information.
        """

        tk.Frame.__init__(self, parent)

        # Create checkbuttons
        self.button_list = []
        self.state_list = []

        for i in range(len(self.WEEKDAYS_STR)):
            self.state_list.append(tk.StringVar())
            self.button_list.append(tk.Checkbutton(self,
                                                   text=self.WEEKDAYS_CHAR[i],
                                                   onvalue=self.WEEKDAYS_STR[i],
                                                   offvalue="",
                                                   variable=self.state_list[i]))

        # Add widgets to grid
        for i in range(len(self.button_list)):
            self.button_list[i].grid(row=0, column=i, padx=4)
            if habit:
                if self.WEEKDAYS_STR[i] in habit["weekdays"]:
                    self.button_list[i].select()
            else:
                self.button_list[i].select()

    def get_weekdays(self):
        """
        Returns a list of all weekdays selected for the entered habit.
        """

        weekdays = []

        for state in self.state_list:
            weekday = str(state.get())
            if weekday:
                weekdays.append(weekday)

        return weekdays


class HabitWindow(tk.Toplevel):
    """
    The Toplevel window that allows the user to enter new habit information.
    """

    def __init__(self, parent, habit_list, main_canvas_frame, edit_canvas_frame, habit=None):
        """
        HabitWindow constructor.

        parent: (type tk.Tk) The parent window of this window.
        habit_list: (type list[dict]) A list of dictionaries containing habit information.
        main_canvas_frame: (type tk.Frame) The instance of the ScrollingCanvasFrame
        on the main canvas.
        edit_canvas_frame: (type tk.Frame) The instance of the ScrollingCanvasFrame
        on the editing canvas.
        habit: (type dict) A dictionary containing an individual habit's information.
        """

        tk.Toplevel.__init__(self, parent)

        self.parent = parent

        self.resizable(False, False)
        self.title("Enter Habit Information")
        self.focus_force()

        self.create_habit_frame = CreateHabitFrame(parent=self,
                                                   habit_list=habit_list,
                                                   main_canvas_frame=main_canvas_frame,
                                                   habit=habit,
                                                   edit_canvas_frame=edit_canvas_frame)

        self.create_habit_frame.grid(column=0, row=0)


class EditWindow(tk.Toplevel):
    """
    The Toplevel window that allows the user to edit habits.
    """

    def __init__(self, parent, habit_list, main_canvas_frame):
        """
        EditWindow constructor.

        parent: (type tk.Tk) The parent window of this window.
        habit_list: (type list[dict]) A list of dictionaries containing habit information.
        main_canvas_frame: (type tk.Frame) The instance of the ScrollingCanvasFrame
        on the main canvas.
        """

        tk.Toplevel.__init__(self, parent)

        self.parent = parent
        self.habit_list = habit_list
        self.main_canvas_frame = main_canvas_frame

        self.resizable(False, False)
        self.title("Edit")
        self.focus_force()

        self.edit_canvas_frame = ScrollingCanvasFrame(parent=self,
                                                      habit_list=habit_list,
                                                      main_canvas_frame=main_canvas_frame,
                                                      habit_type="edit")

        self.btn_new_habit = tk.Button(self,
                                       text="New Habit",
                                       command=self.open_habit_window,
                                       font=(DEFAULT_FONT, 10))

        self.edit_canvas_frame.grid(column=0, row=0)
        self.btn_new_habit.grid(column=0, row=1, pady=5)

    def open_habit_window(self):
        """
        Creates a new Toplevel window for habit creation.
        """

        habit_window = HabitWindow(
            parent=self.parent,
            habit_list=self.habit_list,
            main_canvas_frame=self.main_canvas_frame,
            edit_canvas_frame=self.edit_canvas_frame)


class TutorialWindow(tk.Toplevel):
    """
    The Toplevel window that shows the tutorial graphic upon first running the program.
    """

    def __init__(self, parent, image_file):
        """
        TutorialWindow constructor.

        parent: (type tk.Tk) The parent window of this window.
        image_file: (type str) The name of an image file that contains the tutorial
        graphic.
        """

        tk.Toplevel.__init__(self, parent)

        self.parent = parent

        self.resizable(False, False)
        self.title("Welcome!")
        self.focus_force()

        # Create widgets
        self.content_frame = tk.Frame(self)
        self.tutorial_image = tk.PhotoImage(file=image_file)
        self.lbl_plant_image = tk.Label(self, image=self.tutorial_image)

        # Add widgets to grid
        self.lbl_plant_image.pack()
        self.content_frame.pack()


def read_habit_file(filename, root):
    """
    Reads a list of habits from a json file and returns them as a list of
    dictionaries.
    return type: list[dict]

    filename: (type str) The name of a .json file containing habit information stored in
    dictionaries separated by linebreaks.
    root: (type tk.Tk) The root window of the program.
    """

    habit_list = []

    # Attempt to read from filename, show tutorial if not found
    try:
        with open(filename, "r") as file:
            file_text = file.read()
    except FileNotFoundError:
        tutorial_window = TutorialWindow(root, "tutorial.png")
        return habit_list

    file_list = file_text.splitlines()

    # Parse file_list into dictionaries and append them to habit_list
    for line in file_list:
        habit = json.loads(line)
        habit_list.append(habit)

    return habit_list


def write_habits_to_file(filename, habit_list):
    """
    Stores a list of habits in a json file separated by linebreaks.

    filename: (type str) The name of a file to be created or overwritten to
    store habit information.
    habit_list: (type list[dict]) A list of dictionaries containing habit information.
    """

    with open(filename, "w") as file:
        for habit in habit_list:
            habit_json = json.dumps(habit)
            file.write(habit_json)
            file.write("\n")


def read_streak_file(filename, current_date):
    """
    Reads a list of active days from a text file and returns them as a list of 
    datetime objects.
    return type: list[dt.datetime]

    filename: (type str) The name of a .txt file containing active days separated
    by linebreaks.
    """

    active_streak_list = []

    # Attempt to read from filename, return current_date as start of streak if not found
    try:
        with open(filename, "r") as file:
            file_text = file.read()
    except FileNotFoundError:
        active_streak_list.append(current_date)
        return active_streak_list

    file_list = file_text.splitlines()

    # Parse file_list into datetime objects and append them to active_streak_list
    for line in file_list:
        day = dt.datetime.strptime(line, "%Y-%m-%d")
        active_streak_list.append(day)

    return active_streak_list


def write_streak_file(filename, active_streak_list):
    """
    Stores a list of days the user was active in a text file separated by linebreaks.

    filename: (type str) The name of a file to be created or overwritten to
    store streak information.
    active_streak_list: (type list[dt.datetime]) A list of all days the user
    was active in their current streak.
    """

    with open(filename, "w") as file:
        for day in active_streak_list:
            file.write(day.strftime("%Y-%m-%d"))
            file.write("\n")


def uncheck_all_habits(habit_list):
    """
    Sets all habits to unchecked at the start of a new day.

    habit_list: (type list[dict]) A list of dictionaries containing habit information.
    """

    for habit in habit_list:
        habit["checked"] = False


def manage_streak(active_streak_list, current_date):
    """
    Manages the current streak, resetting the streak if too many days have passed.

    active_streak_list: (type list[dt.datetime]) A list of all days the user
    was active in their current streak.
    current_date: (type dt.datetime) The current date as a dt.datetime object.
    """

    days_passed = current_date - active_streak_list[-1]

    # Clear streak if the number of days passed is higher than the grace period
    if days_passed > dt.timedelta(days=GRACE_PERIOD):
        active_streak_list.clear()
        active_streak_list.append(current_date)


def get_image_file(active_streak_list):
    """
    Returns the name of an image file to be displayed in MainWindow according to
    current streak length.

    active_streak_list: (type list[dt.datetime]) A list of all days the user
    was active in their current streak.
    """

    streak_length = len(active_streak_list)

    # Select a plant image to return based on streak_length
    if streak_length <= 1:
        return "plant1.png"
    elif streak_length <= 3:
        return "plant2.png"
    elif streak_length <= 7:
        return "plant3.png"
    elif streak_length <= 13:
        return "plant4.png"
    elif streak_length <= 25:
        return "plant5.png"
    elif streak_length <= 39:
        return "plant6.png"
    else:
        return "plant7.png"


def main():

    current_date = dt.datetime.today()

    # Configure root window
    root = tk.Tk()
    root.resizable(False, False)
    root.title("Just Habits")

    # Configure habit_list and active_streak_list
    habit_list = read_habit_file(HABIT_FILE_NAME, root)
    active_streak_list = read_streak_file(STREAK_FILE_NAME, current_date)
    manage_streak(active_streak_list, current_date)

    # Clear checkboxes if it's a new day
    if active_streak_list[-1].strftime("%Y-%m-%d") != current_date.strftime("%Y-%m-%d"):
        uncheck_all_habits(habit_list)

    plant_image_file = get_image_file(active_streak_list)

    content_frame = MainWindow(parent=root,
                               image_file=plant_image_file,
                               habit_list=habit_list,
                               current_date=current_date,
                               active_streak_list=active_streak_list)

    content_frame.grid(column=0, row=0)

    root.mainloop()

    # Write habits and streak to file after root window is closed
    write_habits_to_file(HABIT_FILE_NAME, habit_list)
    write_streak_file(STREAK_FILE_NAME, active_streak_list)


if __name__ == "__main__":

    main()
