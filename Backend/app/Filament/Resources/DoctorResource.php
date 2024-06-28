<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DoctorResource\Pages;
use App\Filament\Resources\DoctorResource\RelationManagers;
use App\Models\Doctor;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class DoctorResource extends Resource
{
    protected static ?string $model = Doctor::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('first_name')->required()
                ->maxLength(255),
                Forms\Components\TextInput::make('last_name')->required()
                ->maxLength(255),
                Forms\Components\TextInput::make('gender')->maxLength(255),
                Forms\Components\TextInput::make('address')->required()
                ->maxLength(255),
                Forms\Components\TextInput::make('phone_number')->required()
                ->maxLength(20),
                Forms\Components\Select::make('department_id')
                ->relationship('department', 'title')
                ->required(),
                Forms\Components\Select::make('specialist_id')
                ->relationship('specialist', 'title')
                ->required(),
                Forms\Components\Select::make('hospital_id')
                ->relationship('hospital', 'name')
                ->required(),
                Forms\Components\TextInput::make('status')->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('hospital_id')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('specialist_id')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('department_id')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('first_name')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('last_name')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('gender')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('address')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('phone_number')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('department.title')
                ->label('Department')
                ->sortable()
                ->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('specialist.title')
                ->label('Specialist')
                ->sortable()
                ->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('hospital.name')
                ->label('Hospital')
                ->sortable()
                ->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('status')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('created_at')->sortable()->searchable()->alignment('center'),
                Tables\Columns\TextColumn::make('updated_at')->sortable()->searchable()->alignment('center'),
                ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListDoctors::route('/'),
            'create' => Pages\CreateDoctor::route('/create'),
            'view' => Pages\ViewDoctor::route('/{record}'),
            'edit' => Pages\EditDoctor::route('/{record}/edit'),
        ];
    }
}
