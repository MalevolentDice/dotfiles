(()=>{
  const subscribers = [];
  function createSignal(initialValue) {
    let value = initialValue;
    
    function set(newValue) {
      value = newValue;
      subscribers.forEach((sub) => sub());
    }
    
    function read() {
      return value;
    }
    return [read, set]
  }
  
  function effect(fn) {
    subscribers.push(fn);
    fn();
  }
  
  const [count, setCount] = createSignal(0);
  setCount(count()+1);
  effect(() => console.log(`A ${count()}`));
  effect(() => console.log(`B ${count()}`));
  setCount(count()+1);
  setCount(count()+1);
})()