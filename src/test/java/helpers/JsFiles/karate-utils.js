function fn() {
    const utils = {};
    
    utils.dateValidator = (s) => {
            var SimpleDateFormat = Java.type("java.text.SimpleDateFormat");
            var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.ms'Z'");
            try {
              sdf.parse(s).time;
              return true;
            } catch(e) {
              karate.log('*** invalid date string:', s);
              return false;
            }
          }
    utils.buildPath = (a,b) => {
            var path= a;
            Object.values(b).forEach(x => {
              path=path+"/"+x;
            });
            return path;
          }

    return utils;
}
