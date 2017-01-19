<template id="template">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <h1>{{ title }}</h1>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <input type="text" v-model="newText"
          placeholder="Enter a new to-do...">
        <input class="btn btn-danger" type="button" value="Cancel" @click="cancelSave">
        <input class="btn btn-primary" type="button" value="Save" @click="saveTodo">
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <!--<ul>
          <li v-for="todo in todos">

          </li>
        </ul> -->
        <div class="table-responsive">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th>#</th>
                <th>TO-DO</th>
                <th>Completed</th>
              </tr>
            </thead>
            <tbody class="sort-wrap" id="sortable">
              <tr v-for="todo in todos">
                <td>
                  <a href="#" @click="editTodo(todo)">
                    <img src="../assets/edit-3-16.jpg">
                  </a>
                  <a href="#" @click="removeTodo(todo)">
                    <img src="../assets/delete-16.jpg">
                  </a>
                </td>
                <td><span :class="{done: todo.done}">{{ todo.text }}</span></td>
                <td><input class="checkbox" type="checkbox"
                  v-model="todo.done"></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Sortable from 'sortablejs'

var STORAGE_KEY = 'todos-list-edaid-1.0'
var todoStorage = {
  fetch: function () {
    var todos = JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]')
    todos.forEach(function (todo, index) {
      todo.id = index
    })
    todoStorage.uid = todos.length
    return todos
  },
  save: function (todos) {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(todos))
  }
}

export default {
  name: 'todolist',
  data () {
    return {
      title: 'What do you\'ve to do?',
      newText: '',
      oldText: '',
      editing: null,
      todos: todoStorage.fetch(),
      order: null
    }
  },
  methods:{
    removeTodo: function(todo){
      this.todos.splice(this.todos.indexOf(todo),1);
    },
    editTodo: function (todo){
      this.oldText = todo.text;
      this.newText = todo.text;
      this.editing = todo;
    },
    saveTodo: function(){
      var value = this.newText.trim();
      if(value != '' && value != null){
        if(this.editing){
          this.editing.text = value;
        }else {
            this.todos.push({
              text: value,
              done: false
            });

        }
      }
      this.newText = '';
      this.editing = null;
    },
    cancelSave: function(todo){
      if(this.editing != null){
        todo.text = this.oldText;
      }
      this.newText = '';
      this.editing = null;
    },
    reorder: function(ev){
      var idx = ev.oldIndex;
      while(idx != ev.newIndex){
        var idx2 = ev.newIndex < ev.oldIndex ? idx-1 : idx+1;
        var todo1 = this.todos[idx];
        var todo2 = this.todos[idx2];

        this.todos[idx] = todo2;
        this.todos[idx2] = todo1;
        idx = idx2;
      }
      todoStorage.save(this.todos);
    }
  },
  watch: {
    todos: {
      handler: function (todos) {
        todoStorage.save(todos)
      },
      deep: true
    }
  },
  mounted: function() {
    this.$nextTick(() => {
      const sortable = Sortable.create(document.getElementById('sortable'), {
        animation: 200,
        onUpdate: this.reorder.bind(this)
      });
    })
  }
}
</script>


<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.done{
  text-decoration: line-through;
}
</style>
