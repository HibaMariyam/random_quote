import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_quote/quotes/cubit/quotes_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
String random='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(children: [
                
                      Text('hello get your quote here:'),
                       ElevatedButton(
                  onPressed: () async {
                    context.read<QuotesCubit>().getQuote();
                  },
                  child: Text("Generate a random quote"),
                ),
                
                      BlocConsumer<QuotesCubit, QuotesState>(
                        listener: (context, state) {
                           if (state is QuotesSuccess) {
                   ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('quote generated')));
                         
                    setState(() {
                      random = state.quotes;
                    });
                   
                
                  } if (state is QuotesFailure) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('no quotes available')));
                  }
                        
                        },
                        builder: (context, state)
                        {
                          if(state is QuotesFailure){
                            return Text(state.msg);
                          }
                         
                         return  state is QuotesLoading
                          
                        ? CircularProgressIndicator()
                        :Container(
                          color: Colors.amber,
                          child: Text(random));
                      
                        }
                      )
                      
                    ]
                    ),
              ),
            )
            

            )
            );
  }
}
