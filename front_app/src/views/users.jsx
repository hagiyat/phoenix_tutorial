var UserBox = React.createClass({
  render: function() {
    return (
      <table className="table userBox">
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th></th>
          </tr>
        </thead>
        <UserList data={this.state.data} />
      </table>
    );
  },
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    this.loadUsersFromServer();
  },
  loadUsersFromServer: function() {
    var self = this;
    $.getJSON(
      this.props.url
    )
    .done(function(data) {
      self.setState({data: data});
    })
    .fail(function(err) {
      console.error(self.props.url, err.toString());
    });
  }
});

var UserList = React.createClass({
  render: function() {
    var userNodes = this.props.data.map(function(user) {
      return (
        <tr>
          <td>{user.name}</td>
          <td>{user.email}</td>

          <td class="text-right">
          </td>
        </tr>
      );
    });
    return (
      <tbody className="UserList">
        {userNodes}
      </tbody>
    );
  }
});

React.render(
  <UserBox url="/api/users" />, document.getElementById('content')
);
